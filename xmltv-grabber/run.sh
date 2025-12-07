#!/bin/bash
set -e

XMLTV_CONFIG=/share/xmltv/sdjson.conf
XMLTV_OUTPUT=/share/xmltv/tv_guide.xml
XMLTV_DIR=/share/xmltv
OPTIONS_FILE=/data/options.json

# Create directory if it doesn't exist
mkdir -p "$XMLTV_DIR"

# Read options from JSON file
SCHEDULESDIRECT_USERNAME=$(jq -r '.schedulesdirect_username // empty' "$OPTIONS_FILE")
SCHEDULESDIRECT_PASSWORD=$(jq -r '.schedulesdirect_password // empty' "$OPTIONS_FILE")
UPDATE_HOUR=$(jq -r '.update_hour // 3' "$OPTIONS_FILE")
DAYS=$(jq -r '.days // 7' "$OPTIONS_FILE")

echo "[INFO] Starting XMLTV Grabber"

# Function to configure tv_grab_zz_sdjson
configure_grabber() {
    echo "[INFO] Configuring Schedules Direct..."
    
    # Create config file
    cat > "$XMLTV_CONFIG" <<EOF
username=$SCHEDULESDIRECT_USERNAME
password=$SCHEDULESDIRECT_PASSWORD
cache=/share/xmltv/sdjson.cache
channel-id-format=default
previously-shown-format=date
mode=lineup
EOF

    # Add lineups from config
    LINEUPS=$(jq -r '.lineups[]? // empty' "$OPTIONS_FILE")
    if [ -n "$LINEUPS" ]; then
        echo "$LINEUPS" | while read -r lineup; do
            if [ -n "$lineup" ]; then
                echo "lineup=$lineup" >> "$XMLTV_CONFIG"
            fi
        done
    fi

    echo "[INFO] Configuration complete"
}

# Function to run the grabber
run_grabber() {
    echo "[INFO] Fetching TV listings for $DAYS days..."
    
    if tv_grab_zz_sdjson --config-file "$XMLTV_CONFIG" --output "$XMLTV_OUTPUT" --days "$DAYS"; then
        echo "[INFO] TV listings updated successfully"
        echo "[INFO] Output saved to: $XMLTV_OUTPUT"
        return 0
    else
        echo "[ERROR] Failed to fetch TV listings"
        return 1
    fi
}

# Check if credentials are provided
if [ -z "$SCHEDULESDIRECT_USERNAME" ] || [ -z "$SCHEDULESDIRECT_PASSWORD" ]; then
    echo "[ERROR] Please configure username and password in add-on configuration"
    exit 1
fi

# Configure on first run or if config doesn't exist
if [ ! -f "$XMLTV_CONFIG" ]; then
    configure_grabber
fi

# Run grabber immediately on startup
run_grabber

# Schedule daily updates
echo "[INFO] Scheduling daily updates at ${UPDATE_HOUR}:00"

while true; do
    current_hour=$(date +%H)
    current_minute=$(date +%M)
    
    if [ "$current_hour" -eq "$UPDATE_HOUR" ] && [ "$current_minute" -eq 0 ]; then
        run_grabber
        sleep 65
    else
        sleep 30
    fi
done
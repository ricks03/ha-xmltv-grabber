#!/usr/bin/with-contenv bashio

XMLTV_CONFIG=/share/xmltv/sdjson.conf
XMLTV_OUTPUT=/share/xmltv/tv_guide.xml
XMLTV_DIR=/share/xmltv

# Create directory if it doesn't exist
mkdir -p "$XMLTV_DIR"

# Read options
SD_USERNAME=$(bashio::config 'sd_username')
SD_PASSWORD=$(bashio::config 'sd_password')
UPDATE_HOUR=$(bashio::config 'update_hour')
DAYS=$(bashio::config 'days')

bashio::log.info "Starting XMLTV Grabber"

# Function to configure tv_grab_zz_sdjson
configure_grabber() {
    bashio::log.info "Configuring Schedules Direct..."
    
    # Create config file
    cat > "$XMLTV_CONFIG" <<EOF
username=$SD_USERNAME
password=$SD_PASSWORD
cache=/share/xmltv/sdjson.cache
channel-id-format=default
previously-shown-format=date
mode=lineup
EOF

    # Add lineups from config
    if bashio::config.has_value 'lineups'; then
        for lineup in $(bashio::config 'lineups'); do
            echo "lineup=$lineup" >> "$XMLTV_CONFIG"
        done
    fi

    bashio::log.info "Configuration complete"
}

# Function to run the grabber
run_grabber() {
    bashio::log.info "Fetching TV listings for $DAYS days..."
    
    if tv_grab_zz_sdjson --config-file "$XMLTV_CONFIG" --output "$XMLTV_OUTPUT" --days "$DAYS" 2>&1 | tee /tmp/grabber.log; then
        bashio::log.info "TV listings updated successfully"
        bashio::log.info "Output saved to: $XMLTV_OUTPUT"
    else
        bashio::log.error "Failed to fetch TV listings"
        cat /tmp/grabber.log
        return 1
    fi
}

# Configure on first run or if config doesn't exist
if [ ! -f "$XMLTV_CONFIG" ] || [ -z "$SD_USERNAME" ] || [ -z "$SD_PASSWORD" ]; then
    if [ -z "$SD_USERNAME" ] || [ -z "$SD_PASSWORD" ]; then
        bashio::log.error "Please configure username and password in add-on configuration"
        exit 1
    fi
    configure_grabber
fi

# Run grabber immediately on startup
run_grabber

# Schedule daily updates
bashio::log.info "Scheduling daily updates at ${UPDATE_HOUR}:00"

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
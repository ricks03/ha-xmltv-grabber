# XMLTV Schedules Direct Grabber

Fetches TV listings from Schedules Direct using tv_grab_zz_sdjson.

## Installation

1. Add this repository to your Home Assistant:
   - Go to **Settings** → **Add-ons** → **Add-on Store**
   - Click the **three dots** (⋮) in the top right
   - Select **Repositories**
   - Add: `https://github.com/ricks03/ha-xmltv-grabber`

2. Install the add-on:
   - Find "XMLTV Schedules Direct Grabber" in the add-on store
   - Click **Install**

## Configuration

Go to the **Configuration** tab and set:
```yaml
schedulesdirect_username: your_schedules_direct_username
schedulesdierct_password: your_schedules_direct_password
update_hour: 3
days: 7
lineups:
  - USA-CA90210-X
  - USA-OTA-90210
```

### Options

- **sd_username**: Your Schedules Direct username (required)
- **sd_password**: Your Schedules Direct password (required)
- **update_hour**: Hour of day (0-23) to update listings (default: 3 AM)
- **days**: Number of days to fetch (1-14, default: 7)
- **lineups**: List of lineup codes from Schedules Direct

## Getting Lineup Codes

1. Log in to https://www.schedulesdirect.org
2. Go to "Lineups" or "Manage Lineups"
3. Your lineup codes look like: `USA-CA90210-X` or `USA-OTA-90210`

## Output

TV guide is saved to: `/share/xmltv/tv_guide.xml`

Access it in Home Assistant at: `/share/xmltv/tv_guide.xml`

## Usage

After the add-on runs, you can use the XML file with:
- XMLTV EPG Integration (available in HACS)
- Custom sensors
- Automations

## Support

Open an issue at: https://github.com/ricks03/ha-xmltv-grabber/issues
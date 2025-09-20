#!/usr/bin/env bash

# Configuration file path
CONFIG_FILE="$HOME/dotfiles/bin/.bin/login_config.conf"

# Check if config file exists and source it
if [[ -f "$CONFIG_FILE" ]]; then
  source "$CONFIG_FILE"
else
  echo "❌ Configuration file not found: $CONFIG_FILE"
  echo "Please create the config file with USERNAME and PASSWORD variables"
  exit 1
fi
# Validate that required variables are set
if [[ -z "$USERNAME" ]]; then
  echo "❌ USERNAME or PASSWORD not set in configuration file"
  exit 1
fi

RESPONSE=$(curl -sk -X POST "https://hfw.vitap.ac.in:8090/logout.xml" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -H "Referer: https://hfw.vitap.ac.in:8090/httpclient.html" \
  --data "mode=193&username=$USERNAME&a=$(date +%s%3N)")

# Extracting values using grep with PCRE
STATUS=$(echo "$RESPONSE" | grep -oP '<status><!\[CDATA\[\K[^]]+')
MESSAGE=$(echo "$RESPONSE" | grep -oP '<message><!\[CDATA\[\K[^]]+')

DECODED_MESSAGE=$(echo "$MESSAGE" | sed "s/&#39;/'/g")

# Display clean message
if [[ "$STATUS" == "LOGIN" ]]; then
  echo -e "\n👋 Logged out successfully: $DECODED_MESSAGED"
else
  echo -e "\n⚠️ Logout failed: $DECODED_MESSAGE"
fi

#!/usr/bin/env bash

# Configuration file path
CONFIG_FILE="$HOME/dotfiles/bin/.bin/login_config.conf"

# Check if config file exists and source it
if [[ -f "$CONFIG_FILE" ]]; then
  # shellcheck source=./login_config.conf
  source "$CONFIG_FILE"
else
  echo "❌ Configuration file not found: $CONFIG_FILE"
  echo "Please create the config file with USERNAME and PASSWORD variables"
  exit 1
fi
# Validate that required variables are set
if [[ -z "$USERNAME" || -z "$PASSWORD" ]]; then
  echo "❌ USERNAME or PASSWORD not set in configuration file"
  exit 1
fi

RESPONSE=$(curl -sk -X POST "https://hfw.vitap.ac.in:8090/login.xml" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -H "Referer: https://hfw.vitap.ac.in:8090/httpclient.html" \
  --data "mode=191&username=$USERNAME&password=$PASSWORD&a=$(date +%s%3N)&producttype=0")

# Extracting values using grep with PCRE
STATUS=$(echo "$RESPONSE" | grep -oP '<status><!\[CDATA\[\K[^]]+')
MESSAGE=$(echo "$RESPONSE" | grep -oP '<message><!\[CDATA\[\K[^]]+')

# Display clean message
if [[ "$STATUS" == "LIVE" ]]; then
  echo -e "\n✅ Logged in successfully: ${MESSAGE//\{username\}/$USERNAME}"
else
  echo -e "\n❌ $MESSAGE"
fi

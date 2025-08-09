#!/usr/bin/env bash

# Replace with your real ID and password
USERNAME="23BCE9210"
PASSWORD="Vanish@05"

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
    echo -e "\n❌ Login failed: $MESSAGE"
fi


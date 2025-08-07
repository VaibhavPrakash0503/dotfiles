#!/usr/bin/env bash

# Replace with your actual username
USERNAME="23BCE9210"

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


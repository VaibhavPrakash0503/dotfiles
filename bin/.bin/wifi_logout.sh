#!/usr/bin/env bash

# Replace with your actual username
USERNAME="23BCE9210"

curl -k -X POST "https://hfw.vitap.ac.in:8090/logout.xml" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -H "Referer: https://hfw.vitap.ac.in:8090/httpclient.html" \
  --data "mode=193&username=$USERNAME&a=$(date +%s%3N)"


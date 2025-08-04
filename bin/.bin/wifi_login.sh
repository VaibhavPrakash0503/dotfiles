#!/usr/bin/env bash

# Replace with your real ID and password
USERNAME="23BCE9210"
PASSWORD="ttxJ94Mh"

curl -k -X POST "https://hfw.vitap.ac.in:8090/login.xml" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -H "Referer: https://hfw.vitap.ac.in:8090/httpclient.html" \
  --data "mode=191&username=$USERNAME&password=$PASSWORD&a=$(date +%s%3N)&producttype=0"


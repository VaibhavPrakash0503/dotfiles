#! /usr/bin/env bash

# Use pass with fzf to fuzzy find password

copy=false

while getopts ":c" opt; do
  case $opt in
  c)
    copy=true
    ;;
  \?)
    echo "unrecognized option '-$OPTARG'"
    echo "Usage: passf [-c]"
    echo "  -c  Copy the password to the clipboard"
    exit 1
    ;;
  esac
done

entry=$(pass git ls-files | sed 's/\.gpg$//' | fzf)

if [ -z "$entry" ]; then
  exit 1
fi

if [ "$copy" = true ]; then
  pass show "$entry" | xclip -selection clipboard
  echo "Password for '$entry' copied to clipboard."
else
  # No option given -> show password
  pass show "$entry"
fi

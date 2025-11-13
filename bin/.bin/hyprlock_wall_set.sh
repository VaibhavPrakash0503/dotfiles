#!/usr/bin/env bash

WALLPAPER_PATH="$1"
HYPRLOCK_CONF="$HOME/.config/hypr/hyprlock.conf"

# Only change the 'path =' line inside the 'background' section
sed -i '/background {/,/}/{s|^  *path = .*|  path = '"$WALLPAPER_PATH"'|}' "$HYPRLOCK_CONF"

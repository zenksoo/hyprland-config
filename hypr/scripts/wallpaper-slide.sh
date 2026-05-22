#!/bin/bash

WALLPAPER_DIR="$HOME/zenkso/m_pictures/wallpapers"
INTERVAL=5  # seconds between each image

while true; do
    for img in "$WALLPAPER_DIR"/*; do
        awww img "$img" \
            --transition-duration 2
        sleep $INTERVAL
    done
done

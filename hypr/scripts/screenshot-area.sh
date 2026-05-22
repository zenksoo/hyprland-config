#!/bin/bash

SCREENSHOTS="$HOME/Pictures/Screenshots"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

CHOICE=$(echo -e " 󰩭  Select Area\n 󰹑  Fullscreen" | rofi -dmenu \
  -location 0 \
  -yoffset -50 \
  -no-fixed-num-lines \
  -no-custom \
  -theme-str 'window {width: 400px; height: 200px;} entry {enabled: false;} inputbar {enabled: false;}')

case "$CHOICE" in
*"Area")
  sleep 0.2
  grim -g "$(slurp)" "$SCREENSHOTS/$DATE.png"
  ;;
*"Fullscreen")
  grim "$SCREENSHOTS/$DATE.png"
  ;;
esac

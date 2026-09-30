#!/bin/bash
playerctl -p spotify metadata --format '  {{ title }} - {{ artist }}'

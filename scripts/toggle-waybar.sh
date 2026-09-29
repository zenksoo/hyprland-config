if pgrep waybar; then
	killall waybar
else
	waybar
fi

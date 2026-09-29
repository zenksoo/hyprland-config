if pgrep -x btop >/dev/null; then
    hyprctl dispatch 'hl.dsp.focus({ window = "title:^(btop)$" })'
else
    hyprctl dispatch 'hl.dsp.exec_cmd("kitty -e btop", { workspace = "6" })'
fi

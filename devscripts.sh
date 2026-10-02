linktohere () {
	local target="${1%/}"
	local name="${target##*/}"
	mv "$target" .
	ln -s "$PWD/$name" "$target"
}

install_configs () {
	local list=(
		"hypr"
		"waybar"
		"wlogout"
		"kitty"
		"nvim"
		"rofi"
		"yazi"
		"wallpapers"
		"lsd"
		"scripts"
		"dolphinrc"
		"kdeglobals"
		"qt6rt"
	)
	for d in "${list[@]}"; do
		ln -sf "$PWD/$d" "$HOME/.config/$d"
		echo "creating symlink: '$HOME/.config/$d' -> '$PWD/$d'"
	done
}

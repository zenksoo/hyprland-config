# Hyprland Config

This repository contains a simple Hyprland desktop setup with:

- **Hyprland** window manager
- **Waybar** status bar
- **SwayNC** notification center
- **Rofi** app launcher
- **Hyprlock** lock screen
- Matching **Neovim** and **Zsh** config files

## Install

1. Clone this repo.
2. Copy or symlink the folders into your config locations:

```bash
mkdir -p ~/.config
ln -sfn "$PWD/hypr" ~/.config/hypr
ln -sfn "$PWD/waybar" ~/.config/waybar
ln -sfn "$PWD/swaync" ~/.config/swaync
ln -sfn "$PWD/rofi" ~/.config/rofi
ln -sfn "$PWD/nvim" ~/.config/nvim
ln -sfn "$PWD/.zshrc" ~/.zshrc
```

3. Install the needed packages on your system:

```bash
hyprland waybar swaync rofi hyprlock kitty dolphin
```

4. Log out and start a Hyprland session.


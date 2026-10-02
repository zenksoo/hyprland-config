-- general

hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 1,
        col = {
            active_border = "0xff333333",
            inactive_border = "0xff000000",
        },
    },
    decoration = {
        rounding = 0,
        blur = {
            enabled = false,
            size = 1,
            passes = 2,
            ignore_opacity = true,
        },
        shadow = {
            enabled = false,
            range = 2,
            render_power = 5,
            color = "0x80000000",
        },
    },
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        accel_profile = "flat",
        sensitivity = 0.7,
        touchpad = {
            natural_scroll = true,
        },
    },
    xwayland = {
        force_zero_scaling = true,
    },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        focus_on_activate = true,
    },
})

-- monitor
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080",
    position = "0x0",
    scale    = 1,
})


-- window rules
hl.window_rule({
	match = { class = "Spotify" },
	opacity = "0.9",
})

hl.window_rule({
	match = { class = "code" },
	opacity = "0.9",
})

-- layer rules
hl.layer_rule({
    match = {
        namespace = "rofi",
    },
    blur = fasle,
})

hl.layer_rule({
    match = {
        namespace = "waybar",
    },
    blur = false,
})

hl.layer_rule({
    match = {
        namespace = "logout_dialog",
    },
    blur = true,
    blur_popups = true,
})


-- keybinds
local mainMod = "SUPER"


-- Actions
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + V", hl.dsp.window.float())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- open
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("rofi -show drun -matching normal"))
hl.bind(mainMod .. " + SHIFT" .. "+" .. "SPACE", hl.dsp.exec_cmd("rofi -show run"))

-- default apps
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("~/.config/scripts/browser.sh"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("~/.config/scripts/capture-region.sh"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("~/.config/scripts/capture-region-satty.sh"))
hl.bind(mainMod .. " + w", hl.dsp.exec_cmd("~/.config/scripts/toggle-waybar.sh"))
hl.bind(mainMod .. " + p", hl.dsp.exec_cmd("~/.config/scripts/focus-btop.sh"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("~/.config/scripts/toggle-hyprpaper.sh"))

-- xxx navigation
hl.bind("ALT + TAB", hl.dsp.window.cycle_next())
hl.bind("ALT + SHIFT + TAB", hl.dsp.window.cycle_next({ next = false }))
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + r", hl.dsp.exec_cmd("killall waybar; waybar"))

-- Play/Pause media (Super + Shift + P)
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("playerctl --player=spotify play-pause"))

-- Next track (Super + Shift + N)
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("playerctl --player=spotify next"))

-- Previous track (Super + Shift + B)
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("playerctl --player=spotify previous"))

-- audio volume, brightness, wifi
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

hl.bind(mainMod .. " + EQUAL", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind(mainMod .. " + SHIFT + EQUAL", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 100%"))
hl.bind(mainMod .. " + MINUS", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind(mainMod .. " + SHIFT + MINUS", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 0%"))
hl.bind(mainMod .. " + backspace", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))

-- hl.bind(mainMod .. " + bracketright", hl.dsp.exec_cmd("brightnessctl set 5%+"))
-- hl.bind(mainMod .. " + SHIFT + bracketright", hl.dsp.exec_cmd("brightnessctl set 100%"))
-- hl.bind(mainMod .. " + bracketleft", hl.dsp.exec_cmd("brightnessctl set 5%-"))
-- hl.bind(mainMod .. " + SHIFT + bracketleft", hl.dsp.exec_cmd("brightnessctl set 0%"))

hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86WLAN", hl.dsp.exec_cmd("nmcli radio wifi toggle"))
hl.bind("XF86Refresh", hl.dsp.exec_cmd("xdotool key F5"))

-- Switch workspaces with mainMod + [0-9]
hl.bind(mainMod .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + " .. 6, hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + " .. 7, hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + " .. 8, hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + " .. 9, hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + " .. 0, hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 1, hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 2, hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 3, hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 4, hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 5, hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 6, hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 7, hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 8, hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 9, hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 0, hl.dsp.window.move({ workspace = 10 }))

-- Move/resize windows
hl.bind(mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true})
hl.bind(mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true})

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- Cursor
hl.env("XCURSOR_SIZE", 10)

-- XDG Desktop Portal
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_MENU_PREFIX", "arch-")

-- QT
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", 1)
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", 1)

-- GTK
hl.env("GDK_SCALE", 1)

-- Mozilla
hl.env("MOZ_ENABLE_WAYLAND", 1)

-- Set the cursor size for xcursor
hl.env("XCURSOR_SIZE", 24)

-- Disable appimage launcher by default
hl.env("APPIMAGELAUNCHER_DISABLE", 1)

-- OZONE
hl.env("OZONE_PLATFORM", "wayland")

-- drivers
hl.env("LIBVA_DRIVER_NAME", "radeonsi")


-- autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme \"Adwaita-dark\"")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"")
end)

-- animation
hl.config({
    animations = {
        enabled = true,
    },
})

-- curves
hl.curve("xxx-in", {
    type = "bezier",
    points = {
        { 0, 1 },
        { 0, 1 },
    },
})

hl.curve("xxx-out", {
    type = "bezier",
    points = {
        { 0, 0 },
        { 1, 0 },
    },
})

hl.curve("xxx-fade-in", {
    type = "bezier",
    points = {
        { 0, 0 },
        { 0.5, 1 },
    },
})

hl.curve("xxx-fade-out", {
    type = "bezier",
    points = {
        { 0.15, 0 },
        { 0, 1 },
    },
})

hl.curve("xxx-workspace", {
    type = "bezier",
    points = {
        { 1, 0 },
        { 0, 1 },
    },
})

-- window animations
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 6,
    bezier = "xxx-in",
    style = "popin 20%",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4,
    bezier = "xxx-in",
    style = "popin 20%",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 4,
    bezier = "xxx-out",
    style = "popin 20%",
})

-- border / fade animations
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "default",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 4,
    bezier = "xxx-in",
})


-- layer animations
hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 1,
    bezier = "xxx-in",
    style = "slide",
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 3,
    bezier = "xxx-in",
    style = "popin 80%",
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 3,
    bezier = "xxx-out",
    style = "popin 80%",
})

hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 2,
    bezier = "xxx-fade-in",
})

hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 2,
    bezier = "xxx-fade-out",
})

-- workspace animations
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 3,
    bezier = "xxx-workspace",
    style = "slide",
})

hl.animation({
    leaf = "specialWorkspace",
    enabled = true,
    speed = 3,
    bezier = "xxx-workspace",
    style = "slidevert",
})



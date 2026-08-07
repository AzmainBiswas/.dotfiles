-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar &")
    hl.exec_cmd("/usr/libexec/polkit-mate-authentication-agent-1 &")
    hl.exec_cmd("nm-applet &")
    hl.exec_cmd("copyq --start-server &")
    hl.exec_cmd("awww-daemon &")
    hl.exec_cmd("awww restore &")
    hl.exec_cmd("flameshot &")
    hl.exec_cmd("bash -c 'source ~/.bash_profile'")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("/usr/libexec/xdg-desktop-portal-hyprland &")
    hl.exec_cmd("/usr/libexec/xdg-desktop-portal &")
end)

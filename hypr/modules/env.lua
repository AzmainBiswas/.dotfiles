-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
-- hl.env("XCURSOR_THEME", "Qogir-Dark")
hl.env("XCURSOR_THEME", "Breeze_Light")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")

hl.permission({ binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name = "pavucontrol",
    match = { class = "^pavucontrol-qt" },
    float = true
})
hl.window_rule({
    name = "easy effect",
    match = { class = "^(org.kde.easyeffects|com.github.wwmm.easyeffects)" },
    float = true
})
hl.window_rule({
    name = "file-managers",
    match = { class = "^(org.kde.dolphin|thunar)" },
    float = true
})

hl.window_rule({
    name = "waypaper",
    match = { class = "^waypaper" },
    float = true
})
hl.window_rule({
    name = "copyq",
    match = { class = "com.github.hluk.copyq" },
    float = true
})
hl.window_rule({
    name = "pip",
    match = { title = "^Picture in picture" },
    float = true
})
hl.window_rule({
    name = "floating terminal",
    match = { class = "float-term" },
    float = true
})
hl.window_rule({
    name = "screensort anotation",
    match = { class = "^(org.ksnip.ksnip)" },
    float = true
})
hl.window_rule({
    name = "waybar blur", 
    match = {class = "waybar"},
    no_blur = false,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

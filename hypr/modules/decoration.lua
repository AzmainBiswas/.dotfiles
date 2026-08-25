hl.config({
    general = {
        gaps_in          = 2,
        gaps_out         = 5,

        border_size      = 2,

        col              = {
            active_border   = "rgba(b0adadaa)",
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing    = false,
        layout           = "scrolling",
    },

})

hl.config({
    decoration = {
        rounding         = 0,
        rounding_power   = 0,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        shadow           = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "0xee1a1a1a",
        },
    },
})

hl.config({
    decoration = {
        blur = {
            enabled  = true,
            size     = 8,
            passes   = 2,
            new_optimizations = true,
            vibrancy = 0.1696,
        },
    }
})

hl.config({
    animations = {
        enabled = false,
    },
})

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        column_width = 0.5,
        explicit_column_widths = "0.5, 0.75, 1.0",
        fullscreen_on_one_column = true,
    },
})

hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    }
})

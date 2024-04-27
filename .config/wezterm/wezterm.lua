local wezterm = require("wezterm")

local config = {}

-- fonts
config.font = wezterm.font_with_fallback({
    "Fira Code",
    "Ubuntu Sans Mono",
    "JetBrainsMono Nerd Font",
    "ComicShannsMono Nerd Font",
    "CaskaydiaCove Nerd Font",
})
config.font_size = 12.5

config.default_cursor_style = "SteadyBlock"
-- SteadyBlock, BlinkingBlock, SteadyUnderline, BlinkingUnderline, SteadyBar, BlinkingBar

-- color scheme
-- config.color_scheme = "Ubuntu"
-- config.color_scheme = "tokyonight_night"
-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "GitHub Dark"
config.color_scheme = 'Solarized Dark Higher Contrast'

-- background
config.window_background_opacity = 0.85

-- dimensions
config.initial_cols = 150
config.initial_rows = 35

config.integrated_title_button_style = "Gnome"
-- hide tab bar
-- config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "TITLE | RESIZE"

config.audible_bell = "Disabled"

-- config.window_background_image = "/mnt/media/wallpapers/cat_leaves.png"
-- config.window_background_image_hsb = {
-- 	-- Darken the background image by reducing it to 1/3rd
-- 	brightness = 0.1,
--
-- 	-- You can adjust the hue by scaling its value.
-- 	-- a multiplier of 1.0 leaves the value unchanged.
-- 	hue = 1.0,
--
-- 	-- You can adjust the saturation also.
-- 	saturation = 1.0,
-- }

config.keys = {
    {
        key = "F11",
        -- mods = "SHIFT|CTRL",
        action = wezterm.action.ToggleFullScreen,
    },
}

return config

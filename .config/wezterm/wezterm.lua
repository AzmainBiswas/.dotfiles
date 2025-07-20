local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

-- fonts
config.font = wezterm.font_with_fallback({
    "IosevkaTerm Nerd Font",
	"JetBrainsMono Nerd Font",
    "MesloLGM Nerd Font",
	"Fira Code",
	"Ubuntu Sans Mono",
	"ComicShannsMono Nerd Font",
	"CaskaydiaCove Nerd Font",
})
config.font_size = 13

config.default_cursor_style = "SteadyBlock"
-- SteadyBlock, BlinkingBlock, SteadyUnderline, BlinkingUnderline, SteadyBar, BlinkingBar

-- color scheme
-- config.color_scheme = "Ubuntu"
-- config.color_scheme = 'GruvboxDarkHard'
-- config.color_scheme = 'DoomOne'
config.color_scheme = "tokyonight_night"
-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "GitHub Dark"
-- config.color_scheme = "Solarized Dark Higher Contrast"

-- background
config.window_background_opacity = 0.9

-- padding
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- dimensions
config.initial_cols = 150
config.initial_rows = 35

config.default_prog = { '/usr/bin/bash', '-l' }

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

config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(act.ClearSelection, pane)
			else
				window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
			end
		end),
	},
}

return config

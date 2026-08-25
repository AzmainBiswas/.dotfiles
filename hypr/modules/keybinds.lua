-- local terminal    = "alacritty"
local terminal    = "foot"
local fileManager = "dolphin"
-- local browser     = "brave-origin"
local browser     = "firefox"


local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT" .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("pkill rofi || rofi -Show drun"), {release = false})
hl.bind(mainMod .. " + SHIFT" .. " + D", hl.dsp.exec_cmd("pkill rofi || rofi -Show run"), {release = false})
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("pkill rofi || rofi -Show window"), {release = false})

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. "+ SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + SHIFT" .. "+ L", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("swaylock -f -c 282828"))
hl.bind(mainMod .. "+ SHIFT + C", hl.dsp.layout("colresize +conf"))

hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("copyq menu"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind(mainMod .. "+ SHIFT + W", hl.dsp.exec_cmd("waypaper --random"))
hl.bind(mainMod .. " + Period", hl.dsp.exec_cmd("rofimoji --action type copy --typer wtype"))

hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("sh -c $HOME/bin/change_profile"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- can be changed with swap
hl.bind(mainMod .. "+ SHIFT " .. " + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. "+ SHIFT " .. " + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. "+ SHIFT " .. " + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. "+ SHIFT " .. " + down", hl.dsp.window.move({ direction = "down" }))

hl.bind("Print", hl.dsp.exec_cmd("take-screensort-wayland "))
hl.bind(mainMod .. "+ SHIFT + S", hl.dsp.exec_cmd("take-screensort-wayland -a"))
hl.bind(mainMod .. "+ CTRL + Print", hl.dsp.exec_cmd("extract-txt"))

hl.bind("SUPER + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.bring_to_top())
end)

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Switch to a submap called `resize`.
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true}), { repeating = true })
    hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true}), { repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = -10, relative = true}), { repeating = true })
    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

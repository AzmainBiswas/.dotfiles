local mp = require("mp")
local utils = require("mp.utils")

local function get_clipboard()
    -- Try wl-paste first (Wayland/Hyprland)
    local res = utils.subprocess({
        args = { "wl-paste", "--no-newline" },
        cancellable = false,
    })

    -- Fallback to xclip if wl-paste fails or isn't installed
    if res.status ~= 0 or not res.stdout or res.stdout == "" then
        res = utils.subprocess({
            args = { "xclip", "-selection", "clipboard", "-out" },
            cancellable = false,
        })
    end

    if res.status == 0 and res.stdout then
        -- Trim surrounding whitespace/newlines
        return res.stdout:match("^%s*(.-)%s*$")
    end
    return nil
end

local function add_from_clipboard()
    local url = get_clipboard()

    if not url or url == "" then
        mp.osd_message("Clipboard is empty", 2)
        return
    end

    -- Basic check to ensure it looks like a URL or file path
    if not url:match("^https?://") and not url:match("^/") then
        mp.osd_message("Clipboard does not contain a valid URL/path", 2)
        return
    end

    mp.commandv("loadfile", url, "append-play")
    mp.osd_message("Added from clipboard to queue " .. url, 2)
end

mp.add_key_binding("CTRL+y", "add-clipboard-url", add_from_clipboard)

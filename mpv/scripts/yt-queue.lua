local mp = require("mp")
local input = require("mp.input")

local function add_to_queue()
    input.get({
        prompt = "YouTube URL: ",

        submit = function(url)
            if not url or url == "" then
                return
            end

            mp.commandv("loadfile", url, "append-play")
            mp.osd_message("Added to queue", 2)
        end,

        opened = function()
            mp.osd_message("Paste a YouTube URL and press Enter", 2)
        end
    })
end

mp.add_key_binding("CTRL+y", "add-youtube-url", add_to_queue)

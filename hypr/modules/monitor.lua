------------------
---- MONITORS ----
------------------
hl.monitor({
    output   = "",
    mode     = "1920x1080@144",
    position = "0x0",
    scale    = "1.25",
})

hl.config({
  xwayland = {
    force_zero_scaling = true
  }
})

-- MONITORS
hl.monitor({
  output = "eDP-1",
  mode = "preferred",
  position = "0x0"
})

hl.monitor({
  output = "",
  -- mode = "highrr",
  -- mode = "highres",
  -- mode = "preferred",
  mirror = "eDP-1",
  position = "auto-center-up",
  scale = "1",
})

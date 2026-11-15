-- WM LOOKS
hl.config({
  general = {
  	border_size = 2,
   	gaps_in = 1,
    gaps_out = 0,

   	col = {
    	active_border = { colors = { "#33ccffee", "#00ff99ee" }, angle = 45 },
     	inactive_border = "#595959aa",
    },
  },

  decoration = {
    rounding = 12,
    rounding_power = 3,

    blur = { enabled = false },
    shadow = { enabled = false },
  },

  misc = {
    disable_hyprland_logo = false,
    font_family = "JetBrains Mono NL",
    splash_font_family = "JetBrains Mono NL",

    mouse_move_enables_dpms = true,
    key_press_enables_dpms = true,
    allow_session_lock_restore = true,
  },

  animations = {
    enabled = true,
    workspace_wraparound = true,
  },
})

-- Animation Definitions
hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1} } })
hl.curve("quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })
hl.curve("easeInOutSine", { type = "bezier", points = { {0.37, 0}, {0.63, 1} } })
hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
-- hl.animation({ leaf = "windowsMove", enabled = true, speed = 1.94, bezier = "linear", style = "slide" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3.03, bezier = "easeInOutSine", style = "fade" })
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 1.94, bezier = "easeInOutSine", style = "slide top" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 1.94, bezier = "easeInOutSine", style = "slide bottom" })
hl.animation({ leaf = "zoomFactor", enabled = true,  speed = 7, bezier = "quick" })

-- Workspaces & Window rules
for i = 1, 2 do
  hl.workspace_rule({ workspace = tostring(i), persistent = true, monitor = "eDP-1" })
end
hl.workspace_rule({ workspace = "special:hud", persistent = true, monitor = "eDP-1" })

hl.window_rule({
  name = "Global Properties",
  match = { class = "*" },

  suppress_event = "maximize",
  decorate = false,
  persistent_size = true,
})

hl.window_rule({
  name = "Floating by Default",
  match = { tag = "floats" },

  float = true,
  suppress_event = "maximize",
  center = true,
})

hl.window_rule({ match = { modal = true }, stay_focused = true })

-- List of windows I want floating by default
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, tag = "+floats", max_size = {"(monitor_w*0.75)", "(monitor_h*0.75)" } })
hl.window_rule({ match = { title = "Vencord QuickCSS Editor" }, tag = "+floats" })
hl.window_rule({ match = { class = "re\\.sonny\\.(Junction|Commit)" }, tag = "+floats", stay_focused = true })
hl.window_rule({ match = { class = "blueman-manager" }, tag = "+floats" })
hl.window_rule({ match = { class = "nm-connection-editor" }, tag = "+floats" })
hl.window_rule({ match = { class = "hyprpwcenter" }, tag = "+floats" })
hl.window_rule({ match = { class = "com.cisco.secureclient.gui" }, tag = "+floats" })
hl.window_rule({ match = { class = "be.alexandervanhee.gradia" }, tag = "+floats" })
hl.window_rule({ match = { modal = true }, tag = "+floats" })

hl.window_rule({ match = { class = "jetbrains-toolbox" }, center = true })
hl.window_rule({ match = { class = "discord" }, workspace = "special:hud silent"})
hl.window_rule({ match = { class = "spotify" }, workspace = "special:hud silent", scrolling_width = "0.65" })
hl.window_rule({ match = { class = "it.mijorus.gearlever" }, scrolling_width = "0.65" })
hl.window_rule({ match = { class = "io.github.tobagin.karere" }, workspace = "2 silent", scrolling_width = "0.35" })

hl.config({ xwayland = { enabled = true } })
hl.config({ misc = { disable_hyprland_logo = true } })
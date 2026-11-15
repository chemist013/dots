-- BINDS

-- Applications
hl.bind(MAIN_MOD .. " + T", hl.dsp.exec_cmd(TERMINAL))
hl.bind(MAIN_MOD .. " + W", hl.dsp.window.close())
hl.bind(MAIN_MOD .. " + E", hl.dsp.exec_cmd(FILE_MANAGER))
hl.bind(MAIN_MOD .. " + SPACE", hl.dsp.exec_cmd(MENU))
hl.bind(MAIN_MOD .. " + L", hl.dsp.exec_cmd("logincl lock-session"))
hl.bind(MAIN_MOD .. " + CTRL + B", hl.dsp.exec_cmd("blueman-manager"))
hl.bind(MAIN_MOD .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(MAIN_MOD .. " + G", hl.dsp.window.fullscreen({ action = "toggle" }))

-- WM SHORTCUTS
-- Basic Movement
hl.bind(MAIN_MOD .. " + up", hl.dsp.focus({ workspace = "m-1" }))
hl.bind(MAIN_MOD .. " + down", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(MAIN_MOD .. " + left", hl.dsp.layout("focus l"))
hl.bind(MAIN_MOD .. " + right", hl.dsp.layout("focus r"))
hl.bind(MAIN_MOD .. " + grave", hl.dsp.workspace.toggle_special("hud"))
for i = 1, 3 do
  hl.bind(MAIN_MOD .. " + " .. tostring(i), hl.dsp.focus({ workspace = tostring(i) }))
  hl.bind(MAIN_MOD .. " + SHIFT + " .. tostring(i), hl.dsp.window.move({ workspace = tostring(i) }))
end

-- Resize columns
hl.bind(MAIN_MOD .. " + CTRL + left", hl.dsp.layout("colresize -conf"))
hl.bind(MAIN_MOD .. " + CTRL + right", hl.dsp.layout("colresize +conf"))

-- Moving Windows
hl.bind(MAIN_MOD .. " + SHIFT + left", hl.dsp.layout("swapcol l"))
hl.bind(MAIN_MOD .. " + SHIFT + right", hl.dsp.layout("swapcol r"))
-- hl.bind(MAIN_MOD .. " + SHIFT + up", hl.dsp.window.move({ worksapce = "e-1" }, true))
-- hl.bind(MAIN_MOD .. " + SHIFT + down", hl.dsp.window.move({ workspace = "e+1" }, true))
hl.bind(MAIN_MOD .. " + SHIFT + grave", hl.dsp.window.move({ workspace = "special:hud" }))

-- Mouse binds
hl.bind(MAIN_MOD .. " + mouse_down", hl.dsp.layout("focus l"))
hl.bind(MAIN_MOD .. " + mouse_left", hl.dsp.layout("focus l"))
hl.bind(MAIN_MOD .. " + mouse_up", hl.dsp.layout("focus r"))
hl.bind(MAIN_MOD .. " + mouse_right", hl.dsp.layout("focus r"))
hl.bind(MAIN_MOD .. " + ALT + mouse_up", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(MAIN_MOD .. " + ALT + mouse_down", hl.dsp.focus({ workspace = "m-1" }))

-- Laptop fn keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"), { locked = true, repeating = true })
hl.bind(HYPER .. " + F8", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"), { locked = true, repeating = true })

hl.bind("XF86AudioLowerVolume", function()
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-")
  -- if (hl.exec_cmd("wpctl get-volume @DEFAULT_AUDIO_SINK | tr -dc 0-9") == 0) then
  --   hl.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK 1")
  -- end
end, { locked = true, repeating = true })
hl.bind(HYPER .. " + F7", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"), { locked = true, repeating = true })

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind(HYPER .. " + F6", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
-- hl.bind("ALT + XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
-- hl.bind(HYPER .. " + ALT + F6", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind(HYPER .. " + F3", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind(HYPER .. " + F2", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind(HYPER .. " + F11", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind(HYPER .. " + F10", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind(HYPER .. " + F9", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Lid switch controls
hl.bind("switch:on:Lid Switch", function()
  hl.dsp.exec_cmd("loginctl lock-session")
  hl.timer(function()
  	hl.dsp.dpms({ action = "disable" , "eDP-1"})
  end, { timeout = 500, type = "oneshot" })
end)
hl.bind("switch:off:Lid Switch", function()
	hl.timer(function()
		hl.dsp.dpms({ action = "enable" , "eDP-1"})
	end, { timeout = 500, type = "oneshot" })
end)

-- Screenshotting
hl.bind("PRINT", hl.dsp.exec_cmd("gradia --screenshot"))
hl.bind("CTRL + PRINT", hl.dsp.exec_cmd("gradia --screenshot=FULL"))
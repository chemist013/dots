-- Startup apps
hl.on("hyprland.start", function()
  -- System services (hopefully will all be quickshell soon)
  hl.exec_cmd("hyprpm reload")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("wl-paste --watch cliphist store")
  hl.exec_cmd("quickshell -d")
  hl.exec_cmd("rclone mount OneDrive_ISU: ~/Remotes/OneDrive --vfs-cache-mode full --daemon")
  hl.exec_cmd("rclone mount Drive: ~/Remotes/Drive --daemon")

  -- Startup Apps
  hl.exec_cmd("flatpak run com.spotify.Client")
  hl.exec_cmd("discord")
  hl.exec_cmd("/usr/lib/firefox/firefox -P personal", { workspace = "1" } )
  hl.exec_cmd("/usr/lib/firefox/firefox -P school", { workspace = "2" } )
end)

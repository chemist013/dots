-- ENVIORNMENT VARIABLES
hl.env("GTK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xkb")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1")
hl.env("HYPRSHOT_DIR", "Pictures/Screenshots")

-- PERMISSIONS
hl.config({
  ecosystem = {
    no_donation_nag = true,
    enforce_permissions = true,
  }
})

hl.permission({binary = "/usr/(bin|local/bin)/grim", type = "screencopy", mode = "allow"})
hl.permission({binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow"})
hl.permission({binary = "/usr/(bin|local/bin)/hyprpm", type = "plugin", mode = "allow"})
hl.permission({binary = "/usr/(bin|local/bin)/hyprlock", type = "screencopy", mode = "allow"})

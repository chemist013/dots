-- INPUT
hl.config({
  input = {
  	-- Keyboard
      kb_options = "caps:hyper,shift:both_capslock",
      numlock_by_default = true,

      -- Mouse
      sensitivity = 0.0,
      accel_profile = "adaptive",
      natural_scroll = false,
      follow_mouse = 1,

      touchpad = {
        natural_scroll = false,
        scroll_factor = 0.9,
        clickfinger_behavior = true,
        -- disable_while_typing = false
        tap_and_drag = false,
      }
  },

  cursor = { no_warps = true, }
})

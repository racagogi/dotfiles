local wezterm = require "wezterm"

return {
  color_scheme = 'tokyonight',
  check_for_updates = false,
  font_size = 14.0,
  font = wezterm.font_with_fallback {
    'JetBrains Mono',
    'KoPubBatang_Pro',
    'JetBrainsMono Nerd Font Mono',
    'Noto Serif CJK KR'
  },
  adjust_window_size_when_changing_font_size = false,
  audible_bell = "Disabled",
  enable_scroll_bar = false,
  enable_tab_bar = false,
  window_decorations = "NONE",
  inactive_pane_hsb = {
    saturation = 1.0,
    brightness = 1.0,
  },
  window_background_opacity = 0.6,
  window_padding = {
    left = '0.5cell',
    right = '0cell',
    top = '0.5cell',
    bottom = '0.5cell',
  },
  scrollback_lines = 3500,
  disable_default_key_bindings = true,
  keys = {
    { key = 'c', mods = 'CTRL', action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection' },
    { key = 'v', mods = 'CTRL', action = wezterm.action.PasteFrom 'Clipboard' },
    {
      key = 'v',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.SplitHorizontal {
        domain = 'CurrentPaneDomain'
      },
    },
    {
      key = 'Enter',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.SplitVertical {
        domain = 'CurrentPaneDomain'
      },
    },
    {
      key = 'q',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.CloseCurrentPane { confirm = true },
    },
  },

}

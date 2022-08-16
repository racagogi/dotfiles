local wezterm = require "wezterm"
return {
  font = wezterm.font 'JetBrainsMono Nerd Font Mono',
  font_size = 14.0,
  color_scheme = 'tokyonight',
  window_background_opacity = 0.7,
  scrollback_lines = 3500,
  enable_tab_bar = false,
  disable_default_key_bindings = true,
  keys = {
    { key = 'c', mods = 'CTRL', action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection' },
    { key = 'v', mods = 'CTRL', action = wezterm.action.PasteFrom 'Clipboard' },
    { key = 'v', mods = 'CTRL', action = wezterm.action.PasteFrom 'PrimarySelection' },
    {
      key = 'Enter',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.SplitHorizontal {
        domain = 'CurrentPaneDomain'
      },
    },
    {
      key = 'v',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.SplitVertical {
        domain = 'CurrentPaneDomain'
      },
    },
    {
      key = 'w',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.CloseCurrentPane { confirm = true },
    },
  }
}

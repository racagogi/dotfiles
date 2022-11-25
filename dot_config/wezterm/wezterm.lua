local wezterm = require "wezterm"
local colors, _ = wezterm.color.load_scheme("/home/raca/.config/wezterm/selenized-light.toml")
return {
    colors = colors,
    check_for_updates = false,
    font_size = 16.0,
    font = wezterm.font_with_fallback {
        'JetBrains Mono',
        'KoPubBatang_Pro',
        'JetBrainsMono Nerd Font Mono',
        'Noto Serif KR'
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
    default_cursor_style = "SteadyBar",
    window_background_opacity = 1,
    window_padding = {
        left = 5,
        right = 5,
        top = 5,
        bottom = 5,

    },
    scrollback_lines = 3500,
    disable_default_key_bindings = true,
    keys = {
        { key = 'c', mods = 'CTRL', action = wezterm.action.CopyTo 'Clipboard' },
        { key = 'v', mods = 'CTRL', action = wezterm.action.PasteFrom 'Clipboard' },
        {
            key = 'v',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.SplitHorizontal {
                domain = 'DefaultDomain'
            },
        },
        {
            key = 'Enter',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.SplitVertical {
                domain = 'DefaultDomain'
            },
        },
        {
            key = 'q',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.CloseCurrentPane { confirm = true },
        },
    },
}

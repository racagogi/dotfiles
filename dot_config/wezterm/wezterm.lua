local wezterm = require 'wezterm'
local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end
config = {
    color_scheme = 'Gruvbox light, soft (base16)',
    enable_tab_bar = false,
    window_padding = {
        left = 15,
        right = 0,
        top = 15,
        bottom = 0,
    },
    dpi = 144.0,
    font_rules = {
        {
            intensity = 'Bold',
            italic = false,
            font = wezterm.font_with_fallback {
                { family = "JetBrainsMono Nerd Font Mono",                weight = "Bold",    italic = false },
                { family = "NanumBarunGothicOTF YetHangul", weight = "Bold",    italic = false },
                { family = "Noto Sans KR",                  weight = "Bold",    italic = false },
                { family = "STIX Two Math",                 weight = "Regular", italic = false },
                { family = "STIX Two Text",                 weight = "Bold",    italic = false },
                { family = "JuliaMono",                     weight = "Bold",    italic = false },
                { family = "Noto Color Emoji",              weight = "Regular", italic = false },
            },
        },
        {
            intensity = 'Normal',
            italic = false,
            font = wezterm.font_with_fallback {
                { family = "JetBrainsMono Nerd Font Mono",                weight = "Regular", italic = false },
                { family = "NanumBarunGothicOTF YetHangul", weight = "Regular", italic = false },
                { family = "Noto Sans KR",                  weight = "Regular", italic = false },
                { family = "STIX Two Math",                 weight = "Regular", italic = false },
                { family = "STIX Two Text",                 weight = "Regular", italic = false },
                { family = "JuliaMono",                     weight = "Regular", italic = false },
                { family = "Noto Color Emoji",              weight = "Regular", italic = false },
            },
        },
        {
            intensity = 'Bold',
            italic = true,
            font = wezterm.font_with_fallback {
                { family = "JetBrainsMono Nerd Font Mono",   weight = "Bold",    italic = true },
                { family = "MaruBuriOTF",      weight = "Bold",    italic = false },
                { family = "NanumMyeongjoOTF YetHangul", weight = "Regular", italic = false },
                { family = "Noto Serif KR",    weight = "Bold",    italic = false },
                { family = "STIX Two Math",    weight = "Regular", italic = false },
                { family = "STIX Two Text",    weight = "Bold",    italic = false },
                { family = "JuliaMono",        weight = "Bold",    italic = true },
                { family = "Noto Color Emoji", weight = "Regular", italic = false },
            }
        },
        {
            intensity = 'Normal',
            italic = true,
            font = wezterm.font_with_fallback {
                { family = "JetBrainsMono Nerd Font Mono",   weight = "Regular", italic = true },
                { family = "MaruBuriOTF",      weight = "Regular", italic = false },
                { family = "NanumMyeongjoOTF YetHangul", weight = "Regular", italic = false },
                { family = "Noto Serif KR",    weight = "Regular", italic = false },
                { family = "STIX Two Math",    weight = "Regular", italic = false },
                { family = "STIX Two Text",    weight = "Regular", italic = false },
                { family = "JuliaMono",        weight = "Regular", italic = true },
                { family = "Noto Color Emoji", weight = "Regular", italic = false },
            }
        },
    },
    font_size = 12.0,
    disable_default_key_bindings = true,
    audible_bell = 'Disabled',
    window_decorations = "NONE",
    unicode_version = 14,
    inactive_pane_hsb = {
        saturation = 1,
        brightness = 1,
    },
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
return config

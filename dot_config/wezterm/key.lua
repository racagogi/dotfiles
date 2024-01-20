local module = {}
local wezterm = require 'wezterm'

function module.set(config)
    config.disable_default_key_bindings = true
    config.keys = {
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
    }
end

return module

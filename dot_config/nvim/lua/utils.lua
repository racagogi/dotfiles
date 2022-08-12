require('Comment').setup {
    toggler = {
        line  = 'gcc',
        block = 'gbc',
    },
    opleader = {
        line  = 'gc',
        block = 'gb',
    },
    extra = {
        above = 'gcO',
        below = 'gco',
        eol   = 'gcA',
    },
}
require("nvim-autopairs").setup {
    check_ts = true,
}

require("colorizer").setup({ "*" }, {
    RGB      = true,
    name     = false,
    RRGGBB   = true,
    RRGGBBAA = true,
    rgb_fn   = true,
    hsl_fn   = true,
    css      = true,
    css_fn   = true,
})

require("indent_blankline").setup {
    space_char_blankline       = " ",
    show_current_context       = true,
    show_current_context_start = true,
}

require("nvim-surround").setup({})

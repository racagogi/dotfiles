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

require 'jabs'.setup {
  -- Options for the main window
  position = 'center', -- center, corner. Default corner
  width = 80, -- default 50
  height = 20, -- default 10
  border = 'rounded', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default shadow

  offset = { -- window position offset
    top = 0, -- default 0
    bottom = 0, -- default 0
    left = 0, -- default 0
    right = 0, -- default 0
  },

  -- Options for preview window
  preview_position = 'top', -- top, bottom, left, right. Default top
  preview = {
    width = 40, -- default 70
    height = 60, -- default 30
    border = 'single', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default double
  },

  -- Default highlights (must be a valid :highlight)
  highlight = {
    current = "Title", -- default StatusLine
    hidden = "StatusLineNC", -- default ModeMsg
    split = "WarningMsg", -- default StatusLine
    alternate = "StatusLine" -- default WarningMsg
  },

  -- Default symbols
  --[[ symbols = {
    current = "C", -- default 
    split = "S", -- default 
    alternate = "A", -- default 
    hidden = "H", -- default ﬘
    locked = "L", -- default 
    ro = "R", -- default 
    edited = "E", -- default 
    terminal = "T", -- default 
    default_file = "D", -- Filetype icon if not present in nvim-web-devicons. Default 
  } ]]

  -- Keymaps
  keymap = {
    close = "d", -- Close buffer. Default D
    jump = "<cr>", -- Jump to buffer. Default <cr>
    h_split = "h", -- Horizontally split buffer. Default s
    v_split = "v", -- Vertically split buffer. Default v
    preview = "p", -- Open buffer preview. Default P
  },

  -- Whether to use nvim-web-devicons next to filenames
  use_devicons = true-- true or false. Default true
}

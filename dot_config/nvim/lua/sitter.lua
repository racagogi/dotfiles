require 'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<M-c>",
      node_incremental = "<M-f>",
      node_decremental = "<M-d>",
    },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  },
  matchup = {
    enable = true,
  },
}
require('iswap').setup {
  hl_snipe = 'ErrorMsg',
  hl_selection = 'WarningMsg',
  hl_grey = 'LineNr',
  move_cursor = true,
}

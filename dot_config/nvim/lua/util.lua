require('nvim-lastplace').setup {}
require('trim').setup {}
require("expand_expr")
require('Comment').setup {
  toggler = {
    line = 'cll',
    block = 'cbb',
  },
  opleader = {
    line = 'cl',
    block = 'cb',
  },
  mappings = {
    baisic = true,
    extra = false
  }
}
require("nvim-autopairs").setup {
  enable_check_bracket_line = true,
}
require("nvim-autopairs").get_rule("'")[1].not_filetypes = { "scheme", "lisp" }

require('nvim-surround').setup {}

require 'range-highlight'.setup {}
require("indent_blankline").setup {
  show_current_context       = true,
  show_current_context_start = true,
  char_highlight_list        = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
    "IndentBlanklineIndent7",
  },
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

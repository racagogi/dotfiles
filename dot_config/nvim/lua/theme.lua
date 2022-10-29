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
require("tokyonight").setup({
  style = "storm",
  transparent = true,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = 'transparent'
  },
  dim_inactive = false,
  lualine_bold = true,
  hide_inactive_statusline = true,
  on_colors = function(c)
    c.comment = c.teal
    c.fg_gutter = c.bg_dark
    c.dark5 = c.orange
  end,
  on_highlights = function(hl, c)
    local prompt = "#2d3149"
    hl.TelescopeNormal = {
      bg = c.bg_dark,
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
  end,
})

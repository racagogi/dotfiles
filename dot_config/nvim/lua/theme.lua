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
	style = "night",
	transparent = true,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		sidebars = 'transparent',
		floats = 'transparent',
	},
	sidebars = { "qf", "help" },
	dim_inactive = false,
	lualine_bold = true,
	on_colors = function(c)
		c.fg_gutter = c.bg_dark
		c.comment = c.teal
		c.dark5 = c.orange
		c.fg_dark = c.foreground
	end,
	on_highlights = function(hl, c)
		hl.TelescopeBorder = {
			fg = c.bg_dark,
		}
		hl.TelescopePromptBorder = {
			fg = c.bg_dark,
		}
	end,
})

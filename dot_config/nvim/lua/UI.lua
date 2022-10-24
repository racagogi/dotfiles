require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'tokyonight',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		always_divide_middle = false,
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			'fileformat', 'encoding',
		},
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = {},
		lualine_x = {
			'filetype', function()
				local msg = 'No Active Lsp'
				local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
				local clients = vim.lsp.get_active_clients()
				if next(clients) == nil then
					return '〆' .. msg
				end
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						return '々' .. client.name
					end
				end
			end
		},
		lualine_y = {},
		lualine_z = {}
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	winbar = {
		lualine_a = {
			'buffers'
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			'location'
		},
		lualine_z = {
			'progress',
			'mode',

		}
	},
	inactive_winbar = {
		lualine_a = {},
		lualine_b = {
			'buffers'
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	extensions = {
		'nvim-tree',
	}
}

require("symbols-outline").setup({
	highlight_hovered_item = false,
	show_guides            = true,
	auto_preview           = false,
	position               = 'right',
	relative_width         = true,
	width                  = 25,
	auto_close             = true,
	show_numbers           = false,
	show_relative_numbers  = false,
	show_symbol_details    = true,
	preview_bg_highlight   = 'Pmenu',
	autofold_depth         = nil,
	auto_unfold_hover      = true,
	fold_markers           = { '', '' },
	wrap                   = false,
	keymaps                = {
		close          = "q",
		goto_location  = "<Cr>",
		focus_location = "o",
		hover_symbol   = "<C-space>",
		rename_symbol  = "r",
		code_actions   = "a",
		fold           = "h",
		unfold         = "l",
		fold_all       = "W",
		unfold_all     = "E",
		fold_reset     = "R",
	},
	lsp_blacklist          = {},
	symbol_blacklist       = {},
	symbols                = {
		File          = { icon = "", hl = "TSURI" },
		Module        = { icon = "", hl = "TSNamespace" },
		Namespace     = { icon = "", hl = "TSNamespace" },
		Package       = { icon = "", hl = "TSNamespace" },
		Class         = { icon = "𝓒", hl = "TSType" },
		Method        = { icon = "ƒ", hl = "TSMethod" },
		Property      = { icon = "", hl = "TSMethod" },
		Field         = { icon = "", hl = "TSField" },
		Constructor   = { icon = "", hl = "TSConstructor" },
		Enum          = { icon = "ℰ", hl = "TSType" },
		Interface     = { icon = "ﰮ", hl = "TSType" },
		Function      = { icon = "", hl = "TSFunction" },
		Variable      = { icon = "", hl = "TSConstant" },
		Constant      = { icon = "", hl = "TSConstant" },
		String        = { icon = "𝓐", hl = "TSString" },
		Number        = { icon = "#", hl = "TSNumber" },
		Boolean       = { icon = "⊨", hl = "TSBoolean" },
		Array         = { icon = "", hl = "TSConstant" },
		Object        = { icon = "⦿", hl = "TSType" },
		Key           = { icon = "🔐", hl = "TSType" },
		Null          = { icon = "NULL", hl = "TSType" },
		EnumMember    = { icon = "", hl = "TSField" },
		Struct        = { icon = "𝓢", hl = "TSType" },
		Event         = { icon = "🗲", hl = "TSType" },
		Operator      = { icon = "+", hl = "TSOperator" },
		TypeParameter = { icon = "𝙏", hl = "TSParameter" }
	}
})
require("nvim-tree").setup()

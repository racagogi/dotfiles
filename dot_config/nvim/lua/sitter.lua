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
			init_selection = "<F4>",
			node_incremental = "<C-f>",
			node_decremental = "<C-d>",
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

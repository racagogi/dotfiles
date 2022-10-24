require("nvim-autopairs").setup {
	enable_check_bracket_line = true,
}

require("iron.core").setup {
	config = {
		scratch_repl = true,
		repl_definition = {
			sh = {
				command = { "zsh" }
			}
			, lua = {
				command = { "luajit" }
			}
		},
		repl_open_cmd = require('iron.view').split.vertical.botright("50%")
	},
	keymaps = {
		send_motion = "<Leader>sm",
		visual_send = "<Leader>sv",
		send_file = "<Leader>sf",
		send_line = "<Leader>sl",
		send_mark = "<Leader>sm",
		mark_motion = "<Leader>mc",
		mark_visual = "<Leader>mc",
		remove_mark = "<Leader>md",
		exit = "<Leader>q",
		clear = "<Leader>c",
	},
	highlight = {
		italic = true
	}
}

vim.keymap.set('n', '<F1>', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<Leader>h', '<cmd>IronHide<cr>')

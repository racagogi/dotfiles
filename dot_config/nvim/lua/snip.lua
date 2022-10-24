local luasnip = require 'luasnip'
local cmp = require 'cmp'

require("luasnip.loaders.from_vscode").lazy_load()
require("cmp_dictionary").setup({
	dic = {
		spelllang = {
			en = "~/.config/nvim/en.dict",
		},
	},
	exact = 2,
	first_case_insensitive = false,
	document = false,
	document_command = "wn %s -over",
	async = false,
	capacity = 5,
	debug = false,
})
local kind_icons = {
	Text = '  ',
	Method = '  ',
	Function = '  ',
	Constructor = '  ',
	Field = '  ',
	Variable = '  ',
	Class = '  ',
	Interface = '  ',
	Module = '  ',
	Property = '  ',
	Unit = '  ',
	Value = '  ',
	Enum = '  ',
	Keyword = '  ',
	Snippet = '  ',
	Color = '  ',
	File = '  ',
	Reference = '  ',
	Folder = '  ',
	EnumMember = '  ',
	Constant = '  ',
	Struct = '  ',
	Event = '  ',
	Operator = '  ',
	TypeParameter = '  ',
}
cmp.setup {
	snippet = {
		exand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	view = {
		entries = { name = 'custom', selection_order = 'near_cursor' }
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = string.format(kind_icons[vim_item.kind], '%s %s', vim_item.kind)
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[LaTeX]",
			})[entry.source.name]
			return vim_item
		end
	},
	mapping = cmp.mapping.preset.insert({
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' }
		, { name = 'buffer-lines' }
		, { name = 'calc' }
		, { name = 'dictionary' }
		, { name = 'nvim_lsp_document_symbol' }
		, { name = 'nvim_lsp_signature_help' }
		, { name = 'path' }
		, { name = 'latex_symbols' }
	},
}

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources(
		{ name = 'git' },
		{ name = 'conventionalcommits' },
		{ name = 'buffer' }
	)
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
		, { name = 'path' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources(
		{ name = 'path' },
		{ name = 'cmdline' }
		, { name = 'zsh' }
	)
})

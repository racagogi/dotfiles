local opt     = vim.opt
local opts    = { noremap = true, silent = true }
local tapsize = 4

opt.termguicolors = true
opt.encoding      = 'utf-8'
opt.backup        = false
opt.autoread      = true
opt.swapfile      = false

opt.autoindent  = true
opt.expandtab   = true
opt.smarttab    = true
opt.shiftwidth  = tapsize
opt.tabstop     = tapsize
opt.softtabstop = tapsize

opt.hlsearch   = true
opt.ignorecase = true
opt.incsearch  = true
opt.smartcase  = true

opt.showmatch   = true
opt.list        = true
opt.wrap        = true
opt.number      = true
opt.cursorline  = true
opt.completeopt = 'menu,menuone,noselect'
opt.listchars   = { tab = '>> ', trail = '' }
opt.showbreak   = '++'
opt.matchpairs:append('<:>')
opt.nrformats:append('alpha,octal,hex,bin')
opt.clipboard:append('unnamedplus')
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'

vim.opt.runtimepath:append("~/.treesitter")
require 'lsp'
require 'utils'
require 'UI'

vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<F2>', '<Plug>(EasyAlign)', opts)
vim.keymap.set('x', '<F2>', '<Plug>(EasyAlign)', opts)
vim.keymap.set('n', '<F3>', ':SymbolsOutline<CR>', opts)
vim.keymap.set('n', '<s-v>', '<c-v>', opts)
vim.keymap.set('n', '<c-s>', ':wq<CR>', opts)
vim.keymap.set('n', '<c-q>', ':qa!<CR>', opts)
vim.keymap.set('n', 'gj', 'j', opts)
vim.keymap.set('n', 'gk', 'k', opts)
vim.keymap.set('n', 'j', 'gj', opts)
vim.keymap.set('n', 'k', 'gk', opts)
vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, opts)
vim.keymap.set("n", "<space>a", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<space>h", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<space>s", vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "<space>d", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "<space>i", vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<space>n', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<space>g', ':Neogit<CR>', opts)

vim.cmd [[
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
]]
vim.cmd('colorscheme tokyonight')

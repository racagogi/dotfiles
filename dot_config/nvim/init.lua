local opt     = vim.opt
local opts    = { noremap = true, silent = true }
local tapsize = 2

vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  use 'alker0/chezmoi.vim'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use 'numToStr/Comment.nvim'
  use 'windwp/nvim-autopairs'
  use 'norcalli/nvim-colorizer.lua'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'junegunn/vim-easy-align'
  use 'fladson/vim-kitty'
  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-lualine/lualine.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'TimUntersberger/neogit'
  use 'folke/tokyonight.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind.nvim'
  use 'L3MON4D3/LuaSnip'
  use 'simrat39/symbols-outline.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'p00f/nvim-ts-rainbow'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-buffer'
  use 'uga-rosa/cmp-dictionary'
  use 'hrsh7th/cmp-calc'
  use 'dmitmel/cmp-digraphs'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'dmitmel/cmp-cmdline-history'
  use 'max397574/cmp-greek'
  use 'kdheepak/cmp-latex-symbols'
  use 'hrsh7th/cmp-nvim-lua'
  use 'rafamadriz/friendly-snippets'
  use 'molleweide/LuaSnip-snippets.nvim'
  use 'kylechui/nvim-surround'
  use 'MunifTanjim/nui.nvim'
  use 'ShinKage/idris2-nvim'
  use 'wbthomason/packer.nvim'
  use 'williamboman/mason.nvim'
  use 'jayp0521/mason-null-ls.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
end)

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
vim.keymap.set('n', '<F5>', ':w<CR>', opts)
vim.keymap.set('n', '<c-q>', ':qa<CR>', opts)
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

vim.cmd('colorscheme tokyonight')

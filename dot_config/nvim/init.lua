require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lua/plenary.nvim'
    --util
    use 'numToStr/Comment.nvim'
    use "windwp/nvim-autopairs"
    use 'norcalli/nvim-colorizer.lua'
    use "lukas-reineke/indent-blankline.nvim"
    use 'junegunn/vim-easy-align'
    use "fladson/vim-kitty"

    --UI
    use 'kyazdani42/nvim-tree.lua'
    use 'nvim-lualine/lualine.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'TimUntersberger/neogit'
    use 'folke/tokyonight.nvim'

    --lsp
    use "williamboman/nvim-lsp-installer"
    use "neovim/nvim-lspconfig"
    use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind.nvim'
    use 'L3MON4D3/LuaSnip'
    use 'simrat39/symbols-outline.nvim'
    use 'glepnir/lspsaga.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'p00f/nvim-ts-rainbow'

    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-calc"
    use "dmitmel/cmp-digraphs"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lsp-document-symbol"
    use "hrsh7th/cmp-nvim-lsp-signature-help"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "dmitmel/cmp-cmdline-history"
    use "max397574/cmp-greek"
    use "kdheepak/cmp-latex-symbols"
    use "hrsh7th/cmp-nvim-lua"
    use "rafamadriz/friendly-snippets"
    use "molleweide/LuaSnip-snippets.nvim"
end)

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

require 'lsp'
require 'utils'
require 'UI'

vim.keymap.set("n", "[d",       "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "]d",       "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set('n', '<F2>',     '<Plug>(EasyAlign)',                     opts)
vim.keymap.set('x', '<F2>',     '<Plug>(EasyAlign)',                     opts)
vim.keymap.set('n', '<F3>',     ':SymbolsOutline<CR>',                   opts)
vim.keymap.set('n', '<s-v>',    '<c-v>',                                 opts)
vim.keymap.set('n', '<c-s>',    ':wq<CR>',                               opts)
vim.keymap.set('n', '<c-q>',    ':qa!<CR>',                              opts)
vim.keymap.set('n', 'gj',       'j',                                     opts)
vim.keymap.set('n', 'gk',       'k',                                     opts)
vim.keymap.set('n', 'j',        'gj',                                    opts)
vim.keymap.set('n', 'k',        'gk',                                    opts)
vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting,                  opts)
vim.keymap.set("n", "<space>a", "<cmd>Lspsaga code_action<CR>",          opts)
vim.keymap.set("n", "<space>r", "<cmd>Lspsaga rename<CR>",               opts)
vim.keymap.set("n", "<space>h", "<cmd>Lspsaga hover_doc<CR>",            opts)
vim.keymap.set("n", "<space>s", "<Cmd>Lspsaga signature_help<CR>",       opts)
vim.keymap.set("n", "<space>d", "<cmd>Lspsaga preview_definition<CR>",   opts)
vim.keymap.set('n', '<space>n', ':NvimTreeToggle<CR>',                   opts)
vim.keymap.set('n', '<space>g', ':Neogit<CR>',                           opts)

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

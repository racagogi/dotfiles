require('packer').startup(function()
    --lsp
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    --structural edit
    use 'nvim-treesitter/nvim-treesitter'
    use 'p00f/nvim-ts-rainbow'
    use 'andymass/vim-matchup'
    use 'phaazon/hop.nvim'
    use 'mizlan/iswap.nvim'
    --snip
    use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind.nvim'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'kdheepak/cmp-latex-symbols'
    use 'rafamadriz/friendly-snippets'
    --utils
    use 'jghauser/mkdir.nvim'
    use 'ethanholz/nvim-lastplace'
    use 'cappyzawa/trim.nvim'
    use 'AllenDang/nvim-expand-expr'
    use 'numToStr/Comment.nvim'
    use 'windwp/nvim-autopairs'
    use 'kylechui/nvim-surround'
    use 'junegunn/vim-easy-align'
    --UI
    use 'nvim-lualine/lualine.nvim'
    use 'simrat39/symbols-outline.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use 'hkupty/iron.nvim'
    use 'ziontee113/icon-picker.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'stevearc/dressing.nvim'
    use 'TimUntersberger/neogit'
    --theme
    use 'rktjmp/lush.nvim'
    use 'loganswartz/selenized.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'winston0410/range-highlight.nvim'
    -- dependency
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'winston0410/cmd-parser.nvim'
end)
require "lsp"
require "sitter"
require "snip"
require "util"
require "theme"
require "UI"
require "keymap"

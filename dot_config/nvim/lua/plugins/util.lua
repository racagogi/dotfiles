return {
    { 'jghauser/mkdir.nvim' },
    { 'ethanholz/nvim-lastplace',
        config = true, },
    { 'cappyzawa/trim.nvim',
        config = true, },
    { 'AllenDang/nvim-expand-expr',
        keys = {
            { "<M-e>", "<cmd>lua require(\"expand_expr\").expand()<cr>" }
        }
    },
    { 'numToStr/Comment.nvim',
        opts = {
            padding = true,
            toggler = {
                line = '<M-c>',
                block = '<M-b>',
            },
            opleader = {
                line = '<M-c>',
                block = '<M-b>',
            },
        }, },
    { 'windwp/nvim-autopairs',
        opts = {
            enable_check_bracket_line = true,
            fast_wrap = {
                map = '<M-w>',
                chars = { '{', '[', '(', '"', "'" },
                pattern = [=[[%'%"%>%]%)%}%,]]=],
                end_key = '$',
                keys = 'qwertyuiopzxcvbnmasdfghjkl',
                check_comma = true,
                highlight = 'Search',
                highlight_grey = 'Comment'
            },
        }
    },
    { 'kylechui/nvim-surround', config = true },
    { 'junegunn/vim-easy-align',
        keys = {
            {mode={"o", "v","n"}, "<M-a>","<Plug>(EasyAlign)"},
        }
    },
    {
        "max397574/colortils.nvim",
        keys = {
            { "cp", "<cmd>Colortils picker<cr>" },
            { "cg", "<cmd>Colortils greyscale<cr>" },
            { "cl", "<cmd>Colortils lighten<cr>" },
            { "cd", "<cmd>Colortils darken<cr>" },
            { "cr", "<cmd>Colortils gradient<cr>" },
        },
        config = function()
            require("colortils").setup({
            })
        end,
    },
    {
        'kmonad/kmonad-vim'
    }
}

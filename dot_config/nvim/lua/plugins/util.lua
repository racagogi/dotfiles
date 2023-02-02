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
            { "<M-a>", '<Plug>(EasyAlign)', mode = 'n', },
            { "<M-a>", '<Plug>(EasyAlign)', mode = 'x', }
        }
    },
}

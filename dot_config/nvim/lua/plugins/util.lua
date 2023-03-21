return {
    { 'jghauser/mkdir.nvim' },
    {
        'ethanholz/nvim-lastplace',
        config = true,
    },
    {
        'cappyzawa/trim.nvim',
        config = true,
    },
    {
        'AllenDang/nvim-expand-expr',
        keys = {
            { "<M-e>", "<cmd>lua require(\"expand_expr\").expand()<cr>" }
        }
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            padding = true,
            toggler = {
                line = '<M-c>c',
                block = '<M-b>b',
            },
            opleader = {
                line = '<M-c>',
                block = '<M-b>',
            },
        },
    },
    {
        'windwp/nvim-autopairs',
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
    {
        'junegunn/vim-easy-align',
        keys = {
            { mode = { "o", "v", "n" }, "<M-a>", "<Plug>(EasyAlign)" },
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
    },
    {
        'junegunn/vader.vim'
    },
    {
        'karb94/neoscroll.nvim',
        config = function()
            require('neoscroll').setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
                    '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
                hide_cursor = true,            -- Hide cursor while scrolling
                stop_eof = true,               -- Stop at <EOF> when scrolling downwards
                respect_scrolloff = false,     -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true,   -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = "quadratic", -- Default easing function
                pre_hook = nil,                -- Function to run before the scrolling animation starts
                post_hook = nil,               -- Function to run after the scrolling animation ends
                performance_mode = false,      -- Disable "Performance Mode" on all buffers.
            })
        end
    },
    {
        "rktjmp/highlight-current-n.nvim",
        config = function()
            vim.cmd [[
            nmap * *N
            nmap n <Plug>(highlight-current-n-n)
            nmap N <Plug>(highlight-current-n-N)
            augroup ClearSearchHL
            autocmd!
            autocmd CmdlineEnter /,\? set hlsearch
            autocmd CmdlineLeave /,\? set nohlsearch
            autocmd CmdlineLeave /,\? lua require('highlight_current_n')['/,?']()
            augroup END
            ]]
            require("highlight_current_n").setup({
                highlight_group = "IncSearch" -- highlight group name to use for highlight
            })
        end
    },

}

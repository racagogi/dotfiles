local keyopts = { noremap = true, silent = true }
return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "mrjones2014/nvim-ts-rainbow",
            'JoosepAlviste/nvim-ts-context-commentstring',
            'windwp/nvim-ts-autotag'
        },
        build = ":TSUpdate",
        event = "BufReadPost",
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            context_commentstring = { enable = true, enable_autocmd = false },
            ensure_installed = 'all',
            butotag = {
                enable = true
            },
            sync_install = true,
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<M-s>",
                    node_incremental = "<M-f>",
                    node_decremental = "<M-d>",
                },
            },
            matchup = {
                enable = true,
            },
            rainbow = {
                enable = true,
                extended_mode = true,
            }
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        'andymass/vim-matchup',
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end
    },
    {
        'drybalka/tree-climber.nvim',
        keys = {
            { mode = { 'n', 'v', 'o' }, '<M-k>', "<cmd>lua require('tree-climber').goto_parent()<cr>", keyopts },
            { mode = { 'n', 'v', 'o' }, '<M-j>', "<cmd>lua require('tree-climber').goto_child()<cr>",  keyopts },
            { mode = { 'n', 'v', 'o' }, '<M-l>', "<cmd>lua require('tree-climber').goto_next()<cr>",   keyopts },
            { mode = { 'n', 'v', 'o' }, '<M-h>', "<cmd>lua require('tree-climber').goto_prev()<cr>",   keyopts },
        }
    },
    {
        'phaazon/hop.nvim',
        keys = {
            { mode = { 'n', 'v', 'o' }, '<M-v>', "<cmd>HopVertical<cr>", keyopts },
            { mode = { 'n', 'v', 'o' }, '<M-p>', "<cmd>HopPattern<cr>",  keyopts },
            { mode = { 'n', 'v', 'o' }, '<M-w>', "<cmd>HopWord<cr>",     keyopts },
            {
                mode = { 'n', 'v', 'o' },
                'f',
                function()
                    local hop = require('hop')
                    local directions = require('hop.hint').HintDirection
                    hop.hint_char1({ direction = directions.AFTER_CURSOR })
                end,
                keyopts
            },
            {
                mode = { 'n', 'v', 'o' },
                'F',
                function()
                    local hop = require('hop')
                    local directions = require('hop.hint').HintDirection
                    hop.hint_char1({ direction = directions.BEFORE_CURSOR })
                end,
                keyopts
            },
            {
                mode = { 'n', 'v', 'o' },
                't',
                function()
                    local hop = require('hop')
                    local directions = require('hop.hint').HintDirection
                    hop.hint_char1({ direction = directions.AFTER_CURSOR, hint_offset = -1 })
                end,
                keyopts
            },
            {
                mode = { 'n', 'v', 'o' },
                'T',
                function()
                    local hop = require('hop')
                    local directions = require('hop.hint').HintDirection
                    hop.hint_char1({ direction = directions.BEFORE_CURSOR, hint_offset = 1 })
                end,
                keyopts
            },
        },
        config = true
    },
    {
        'mizlan/iswap.nvim',
        keys = {
            { "<M-n>", "<cmd>ISwapNodeWith<CR>" }
        },
        config = true
    }, {
    "sitiom/nvim-numbertoggle"
}, {
    'gpanders/nvim-parinfer'
}
}

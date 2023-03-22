return {
    {
        "ellisonleao/gruvbox.nvim",
        config = function()
            require("gruvbox").setup({
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true,    -- invert background for search, diffs, statuslines and errors
                contrast = "soft", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
            vim.cmd [[
            set background=light
            colorscheme gruvbox
            ]]
        end
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "*" }, {
                RGB      = true,
                name     = false,
                RRGGBB   = true,
                RRGGBBAA = true,
                rgb_fn   = true,
                hsl_fn   = true,
                css      = true,
                css_fn   = true,
            })
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            vim.cmd [[highlight IndentBlanklineIndent1            guifg=#cc241d gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent2            guifg=#d65d0e gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent3            guifg=#d79921 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent4            guifg=#98971a gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent5            guifg=#458588 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent6            guifg=#b16286 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineSpaceCharBlankline guifg=#076678 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineSpaceChar          guifg=#076678 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineChar               guifg=#076678 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineContextChar        guifg=#427b58 gui=nocombine]]

            require("indent_blankline").setup {
                show_current_context       = true,
                show_current_context_start = true,
                char_highlight_list        = {
                    "IndentBlanklineIndent1",
                    "IndentBlanklineIndent2",
                    "IndentBlanklineIndent3",
                    "IndentBlanklineIndent4",
                    "IndentBlanklineIndent5",
                    "IndentBlanklineIndent6",
                },
            }
        end
    },
    {
        "winston0410/range-highlight.nvim",
        dependencies = {
            "winston0410/cmd-parser.nvim"
        },
        config = true
    },
}

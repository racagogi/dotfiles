return {
    {
        "loganswartz/selenized.nvim",
        dependencies = {
            "rktjmp/lush.nvim",
        },
        config = function()
            vim.cmd([[
            set background=light
            colorscheme selenized]])
        end,
    },
    { "norcalli/nvim-colorizer.lua",
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
        end },
    { "lukas-reineke/indent-blankline.nvim",
        config = function()
            vim.cmd [[
            highlight IndentBlanklineIndent1 guifg=#cc1729
            highlight IndentBlanklineIndent2 guifg=#bc5819
            highlight IndentBlanklineIndent3 guifg=#a78300
            highlight IndentBlanklineIndent4 guifg=#428b00
            highlight IndentBlanklineIndent5 guifg=#006dce
            highlight IndentBlanklineIndent6 guifg=#00978a
            highlight IndentBlanklineIndent7 guifg=#825dc0
            ]]
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
                    "IndentBlanklineIndent7",
                },
            }
        end
    },
    { "winston0410/range-highlight.nvim",
        dependencies = {
            "winston0410/cmd-parser.nvim"
        },
        config = true },
}

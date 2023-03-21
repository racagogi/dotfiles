return {
    -- {
    --     "loganswartz/selenized.nvim",
    --     dependencies = {
    --         "rktjmp/lush.nvim",
    --     },
    --     config = function()
    --         vim.cmd([[
    --         set background=light
    --         colorscheme selenized]])
    --     end,
    -- },
    -- {
    --     'folke/tokyonight.nvim',
    --     config = function()
    --         require("tokyonight").setup({
    --             style = "night",
    --             -- transparent = true,
    --             terminal_colors = true,
    --             styles = {
    --                 comments = { italic = true },
    --                 keywords = { italic = true },
    --                 functions = {},
    --                 variables = {},
    --                 sidebars = "storm",
    --                 floats = "storm",
    --             },
    --             sidebars = { "qf", "help" },
    --             hide_inactive_statusline = true,
    --             dim_inactive = false,
    --             lualine_bold = true,
    --             -- on_colors = function(c)
    --             --     c.bg             = "#fbf3db"
    --             --     c.bg_dark        = "#ece3cc"
    --             --     c.bg_highlight   = "#d5cdb6"
    --             --     c.fg             = "#53676d"
    --             --     c.fg_dark        = "#3a4d53"
    --             --     c.dark3          = "#545c7e"
    --             --     c.dark5          = "#909995"
    --             --     c.blue           = "#0072d4"
    --             --     c.cyan           = "#009c8f"
    --             --     c.blue0          = "#3d59a1"
    --             --     c.blue1          = "#0072d4"
    --             --     c.blue2          = "#0db9d7"
    --             --     c.blue5          = "#006dce"
    --             --     c.blue6          = "#00978a"
    --             --     c.blue7          = "#394b70"
    --             --     c.magenta        = "#ca4898"
    --             --     c.magenta2       = "#c44392"
    --             --     c.purple         = "#8762c6"
    --             --     c.orange         = "#c25d1e"
    --             --     c.yellow         = "#ad8900"
    --             --     c.green          = "#489100"
    --             --     c.green1         = "#428b00"
    --             --     c.green2         = "#008400"
    --             --     c.teal           = "#00978a"
    --             --     c.red            = "#d2212d"
    --             --     c.red1           = "#cc1729"
    --             --     c.terminal_black = "#414868"
    --             --     c.comment        = "#565f89"
    --             --     c.fg_gutter      = "#3b4261"
    --             -- end,
    --         })
    --         vim.cmd [[colorscheme tokyonight]]
    --     end
    -- },
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
            vim.cmd [[highlight IndentBlanklineIndent1 guifg=#cc241d gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent2 guifg=#d65d0e gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent3 guifg=#d79921 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent4 guifg=#98971a gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent5 guifg=#458588 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent6 guifg=#b16286 gui=nocombine]]
            require("indent_blankline").setup {
                -- show_current_context       = true,
                -- show_current_context_start = true,
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

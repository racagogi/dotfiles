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
    -- {
    --     'folke/tokyonight.nvim',
    --     config = function()
    --         require("tokyonight").setup({
    --             style = "storm",
    --             transparent = true,
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
            vim.cmd [[highlight IndentBlanklineIndent1 guifg=#c00221 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent2 guifg=#b04713 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent3 guifg=#9b7600 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent4 guifg=#3f8100 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent5 guifg=#005dcc gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent6 guifg=#714cbc gui=nocombine]]
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
    { "winston0410/range-highlight.nvim",
        dependencies = {
            "winston0410/cmd-parser.nvim"
        },
        config = true },
    --[[ {
        "folke/noice.nvim",
        config = function()
            require("noice").setup({
                cmdline = {
                    enabled = true,
                    view = "cmdline_popup",
                    opts = {},
                    format = {
                        cmdline = { pattern = "^:", icon = "", lang = "vim" },
                        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                        lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
                        help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
                        input = {}, -- Used by input()
                    },
                },
                messages = {

                    enabled = true,
                    view = "notify",
                    view_error = "notify",
                    view_warn = "notify",
                    view_history = "messages",
                    view_search = "virtualtext",
                },
                popupmenu = {
                    enabled = true,
                    backend = "nui",
                    kind_icons = {},
                },
                redirect = {
                    view = "popup",
                    filter = { event = "msg_show" },
                },
                commands = {
                    history = {
                        view = "split",
                        opts = { enter = true, format = "details" },
                        filter = {
                            any = {
                                { event = "notify" },
                                { error = true },
                                { warning = true },
                                { event = "msg_show", kind = { "" } },
                                { event = "lsp", kind = "message" },
                            },
                        },
                    },
                    last = {
                        view = "popup",
                        opts = { enter = true, format = "details" },
                        filter = {
                            any = {
                                { event = "notify" },
                                { error = true },
                                { warning = true },
                                { event = "msg_show", kind = { "" } },
                                { event = "lsp", kind = "message" },
                            },
                        },
                        filter_opts = { count = 1 },
                    },
                    errors = {
                        view = "popup",
                        opts = { enter = true, format = "details" },
                        filter = { error = true },
                        filter_opts = { reverse = true },
                    },
                },
                notify = {
                    enabled = true,
                    view = "notify",
                },
                lsp = {
                    progress = {
                        enabled = true,
                        format = "lsp_progress",
                        format_done = "lsp_progress_done",
                        throttle = 1000 / 30,
                        view = "mini",
                    },
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                    hover = {
                        enabled = true,
                        view = nil,
                        opts = {},
                    },
                    signature = {
                        enabled = false,
                    },
                    message = {
                        enabled = true,
                        view = "notify",
                        opts = {},
                    },
                    documentation = {
                        view = "hover",
                        opts = {
                            lang = "markdown",
                            replace = true,
                            render = "plain",
                            format = { "{message}" },
                            win_options = { concealcursor = "n", conceallevel = 3 },
                        },
                    },
                },
                markdown = {
                    hover = {
                        ["|(%S-)|"] = vim.cmd.help,
                        ["%[.-%]%((%S-)%)"] = require("noice.util").open,
                    },
                    highlights = {
                        ["|%S-|"] = "@text.reference",
                        ["@%S+"] = "@parameter",
                        ["^%s*(Parameters:)"] = "@text.title",
                        ["^%s*(Return:)"] = "@text.title",
                        ["^%s*(See also:)"] = "@text.title",
                        ["{%S-}"] = "@parameter",
                    },
                },
                health = {
                    checker = true,
                },
                smart_move = {

                    enabled = true,

                    excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
                },
                presets = {
                    bottom_search = false,
                    command_palette = false,
                    long_message_to_split = false,
                    inc_rename = false,
                    lsp_doc_border = false,
                },
                throttle = 1000 / 30,
                views = {},
                routes = {},
                status = {},
                format = {},
            })
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
            config = function()

            end
        }
    } ]]
}

return {
    { 'simrat39/symbols-outline.nvim',
        keys = { { '<F2>', ':SymbolsOutline<CR>' } },
        opts = {
            highlight_hovered_item = false,
            show_guides            = true,
            auto_preview           = false,
            position               = 'right',
            relative_width         = true,
            width                  = 25,
            auto_close             = true,
            show_numbers           = false,
            show_relative_numbers  = false,
            show_symbol_details    = true,
            preview_bg_highlight   = 'Pmenu',
            autofold_depth         = nil,
            auto_unfold_hover      = true,
            fold_markers           = { '', '' },
            wrap                   = false,
            keymaps                = {
                close          = "q",
                goto_location  = "<CR>",
                focus_location = "o",
                hover_symbol   = "<space>h",
                rename_symbol  = "<space>r",
                code_actions   = "<space>a",
                fold           = "zc",
                unfold         = "zo",
                fold_all       = "zM",
                unfold_all     = "zR",
            },
            lsp_blacklist          = {},
            symbol_blacklist       = {},
            symbols                = {
                File          = { icon = "", hl = "TSURI" },
                Module        = { icon = "", hl = "TSNamespace" },
                Namespace     = { icon = "", hl = "TSNamespace" },
                Package       = { icon = "", hl = "TSNamespace" },
                Class         = { icon = "", hl = "TSType" },
                Method        = { icon = "", hl = "TSMethod" },
                Property      = { icon = "", hl = "TSMethod" },
                Field         = { icon = "", hl = "TSField" },
                Constructor   = { icon = "", hl = "TSConstructor" },
                Enum          = { icon = "", hl = "TSType" },
                Interface     = { icon = "", hl = "TSType" },
                Function      = { icon = "", hl = "TSFunction" },
                Variable      = { icon = "", hl = "TSConstant" },
                Constant      = { icon = "", hl = "TSConstant" },
                String        = { icon = "", hl = "TSString" },
                Number        = { icon = "", hl = "TSNumber" },
                Boolean       = { icon = "", hl = "TSBoolean" },
                Array         = { icon = "", hl = "TSConstant" },
                Object        = { icon = "", hl = "TSType" },
                Key           = { icon = " ", hl = "TSType" },
                Null          = { icon = "", hl = "TSType" },
                EnumMember    = { icon = "", hl = "TSField" },
                Struct        = { icon = "", hl = "TSType" },
                Event         = { icon = "", hl = "TSType" },
                Operator      = { icon = "", hl = "TSOperator" },
                TypeParameter = { icon = "", hl = "TSParameter" }
            }
        }
    },
    { 'nvim-tree/nvim-tree.lua',
        keys = { { '<F1>', ':NvimTreeToggle<CR>' } },
        opts = {
            disable_netrw = true
            , hijack_unnamed_buffer_when_opening = true
            , remove_keymaps = true,
            view = {
                number = false
                , mappings = {
                    custom_only = true
                    , list = {
                        { key = "<CR>", action = "edit" },
                        { key = "R", action = "refresh" },
                        { key = "a", action = "create" },
                        { key = "d", action = "remove" },
                        { key = "r", action = "rename" },
                        { key = "x", action = "cut" },
                        { key = "c", action = "copy" },
                        { key = "p", action = "paste" },
                        { key = "y", action = "copy_absolute_path" },
                        { key = "q", action = "close" },
                        { key = "zc", action = "collapse_all" },
                        { key = "zR", action = "expand_all" },
                        { key = "i", action = "toggle_file_info" },
                    }
                }
            }

        }
    },
    { 'hkupty/iron.nvim',
        keys = { { '<F3>', '<cmd>IronRepl<cr>' } },
        config = function()
            require("iron.core").setup {
                config = {
                    scratch_repl = true,
                    repl_definition = { sh = {
                        command = { "zsh" }
                    }
                        , lua = {
                            command = { "luajit" }
                        }
                    }, repl_open_cmd = require('iron.view').split.vertical.botright("50%")
                },
                keymaps = {
                    send_motion = "gm",
                    visual_send = "gv",
                    send_file = "gf",
                    send_line = "gl",
                    exit = "<Leader>q",
                    clear = "<Leader>c",
                },
                highlight = {
                    italic = true
                }
            }
        end
    },
    { 'ziontee113/icon-picker.nvim',
        opts = { disable_legacy_commands = true },
        keys = {
            { '<M-1>', '<cmd>IconPickerInsert<CR>' }
        }
    },

    { 'TimUntersberger/neogit',
        keys = { { '<M-3>', '<cmd>Neogit<CR>' } },
        opts = {
            mappings = {
                status = {
                    ["f"] = "PushPopup",
                    ["P"] = "",
                }
            }
        }
    }
}

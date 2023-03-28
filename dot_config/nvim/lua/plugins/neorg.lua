return {
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        config = function()
            vim.cmd [[
            set autochdir
            ]]
            require "neorg".setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.keybinds"] = {
                        config = {
                            default_keybinds = false,
                            hook = function(keybinds)
                                keybinds.remap_event("norg", "n", "gc",
                                    ":Neorg keybind all core.looking-glass.magnify-code-block<CR>")
                                keybinds.remap_event("norg", "n", "gtd", "core.norg.qol.todo_items.todo.task_done")
                                keybinds.remap_event("norg", "n", "gtu", "core.norg.qol.todo_items.todo.task_undone")
                                keybinds.remap_event("norg", "n", "gtp", "core.norg.qol.todo_items.todo.task_pending")
                                keybinds.remap_event("norg", "n", "gth", "core.norg.qol.todo_items.todo.task_on_hold")
                                keybinds.remap_event("norg", "n", "gtc", "core.norg.qol.todo_items.todo.task_cancelled")
                                keybinds.remap_event("norg", "n", "gtr", "core.norg.qol.todo_items.todo.task_recurring")
                                keybinds.remap_event("norg", "n", "gti", "core.norg.qol.todo_items.todo.task_important")
                                keybinds.remap_event("norg", "n", "gs", "core.norg.qol.todo_items.todo.task_cycle")
                                keybinds.remap_event("norg", "n", "gj", "core.promo.promote")
                                keybinds.remap_event("norg", "n", "gk", "core.promo.demote")
                                keybinds.remap_event("norg", "n", "go", "core.itero.next-iteration")
                                keybinds.remap_event("norg", "n", "gl", "core.norg.esupports.hop.hop-link")
                                keybinds.remap_event("norg", "n", "<leader>lf",
                                    "core.integrations.telescope.insert_file_link")
                                keybinds.remap_event("norg", "n", "<leader>ll", "core.integrations.telescope.insert_link")
                                keybinds.remap_event("norg", "i", "<leader>lf",
                                    "core.integrations.telescope.insert_file_link")
                                keybinds.remap_event("norg", "i", "<leader>ll", "core.integrations.telescope.insert_link")
                            end,
                        }
                    },
                    ["core.norg.concealer"] = {},
                    ["core.export"] = {},
                    ["core.export.markdown"] = {},
                    ["core.norg.completion"] = {
                        config = {
                            engine = "nvim-cmp",
                            name = "[Neorg]"
                        }
                    },
                    ["core.integrations.nvim-cmp"] = {},
                    ["core.norg.dirman"] = {
                        config = {
                            default_workspace = "danish",
                            workspaces = {
                                danish = "~/.mind/data",
                            },
                        }
                    },
                    ["core.integrations.telescope"] = {},
                },
            }
        end,
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-neorg/neorg-telescope" } },
    },
    {
        'phaazon/mind.nvim',
        keys = {
            { "gm", ":lua require 'mind'.open_main()<cr>",        desc = "open main" },
            { "gp", ":lua require 'mind'.open_project(true)<cr>", desc = "open local" },
            { "gc", ":lua require 'mind'.close() <cr>" },
        },
        config = function()
            require 'mind'.setup({
                edit = {
                    data_extension = ".norg",
                    data_header = "* %s",
                    copy_link_format = "[](%s)",
                },
                persistence = {
                    state_path = "~/.mind/index.json",
                    data_dir = "~/.mind/data"
                },
                keymaps = {
                    normal = {
                        ["<cr>"] = "open_data",
                        ["<s-cr>"] = "open_data_index",
                        ["<tab>"] = "toggle_node",
                        ["<s-tab>"] = "toggle_node",
                        ["/"] = "select_path",
                        ["m"] = "change_icon_menu",
                        c = "add_inside_end_index",
                        I = "add_inside_start",
                        i = "add_inside_end",
                        l = "copy_node_link",
                        L = "copy_node_link_index",
                        d = "delete",
                        D = "delete_file",
                        O = "add_above",
                        o = "add_below",
                        q = "quit",
                        r = "rename",
                        R = "change_icon",
                        u = "make_url",
                        s = "select",
                        t = function(args)
                            require 'mind.ui'.with_cursor(function(line)
                                local tree = args.get_tree()
                                local node = require 'mind.node'.get_node_by_line(tree, line)

                                if node.icon == nil or node.icon == ' ' then
                                    node.icon = ' '
                                elseif node.icon == ' ' then
                                    node.icon = ' '
                                elseif node.icon == ' ' then
                                    node.icon = ' '
                                end

                                args.save_tree()
                                require 'mind.ui'.rerender(tree, args.opts)
                            end)
                        end
                    },
                    selection = {
                        ["<cr>"] = "open_data",
                        ["<s-tab>"] = "toggle_node",
                        ["/"] = "select_path",
                        I = "move_inside_start",
                        i = "move_inside_end",
                        O = "move_above",
                        o = "move_below",
                        q = "quit",
                        x = "select",
                    }
                }
            })
        end
    }
}

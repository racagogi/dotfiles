return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        cmd          = "Telescope",
        keys         = {
            { "<leader>c", "<cmd>Telescope buffers<cr>",                   desc = "Buffers" },
            { "<leader>a", "<cmd>Telescope autocommands<cr>",              desc = "Auto     Commands" },
            { "<leader>f", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
            { "<leader>h", "<cmd>Telescope highlights<cr>",                desc = "Search   Highlight Groups" },
            { "<leader>k", "<cmd>Telescope keymaps<cr>",                   desc = "Key      Maps" },
            { "<leader>r", "<cmd>Telescope registers<cr>",                 desc = "Register find" },
            { mode = {"n","i"}, "<leader>F", "<cmd>Telescope find_files<cr>",                desc = "File     Search" },
        },
        opts         = {
            defaults = {
                mappings = {
                    i = {
                        ["<tab>"] = function(...)
                            return require("telescope.actions").cycle_history_next(...)
                        end,
                        ["<s-tab>"] = function(...)
                            return require("telescope.actions").cycle_history_prev(...)
                        end,
                    },
                },
            },
        },
    }
}

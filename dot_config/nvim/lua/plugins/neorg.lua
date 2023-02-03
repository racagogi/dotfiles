return {
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.export"] = {
                    config = { -- Note that this table is optional and doesn't need to be provided
                    }
                },
                ["core.export.markdown"] = {
                    config = { -- Note that this table is optional and doesn't need to be provided
                        -- Configuration here
                    }
                },
                ["core.integrations.nvim-cmp"] = {
                    config = { -- Note that this table is optional and doesn't need to be provided
                        -- Configuration here
                    }
                },
                ["core.norg.completion"] = {
                    config = { -- Note that this table is optional and doesn't need to be provided
                        -- Configuration here
                        engine = "nvim-cmp"
                    }
                },
                ["core.norg.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                    },
                },
            },
        },
        dependencies = { { "nvim-lua/plenary.nvim" } },
    }
}

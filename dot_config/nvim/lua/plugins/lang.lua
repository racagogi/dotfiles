return {
    {
        'ShinKage/idris2-nvim',
        dependencies = {
            'MunifTanjim/nui.nvim'
        },
        config = true,
    },
    {
        'saecki/crates.nvim',
        config = function()
            require('crates').setup {
                null_ls = {
                    enabled = true,
                    name = "crates.nvim",
                },
            }
        end,
    }
}

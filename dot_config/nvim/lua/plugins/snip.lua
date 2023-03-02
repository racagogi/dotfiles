return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        opts = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            'onsails/lspkind.nvim',
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            'doxnit/cmp-luasnip-choice',
            'hrsh7th/cmp-calc',
            'petertriho/cmp-git',
            'tamago324/cmp-zsh',
            'ray-x/cmp-treesitter',
            'kdheepak/cmp-latex-symbols',
            config = function()
                require('cmp_luasnip_choice').setup({
                    auto_open = true,
                });
            end
        },
        opts = function()
            local cmp = require("cmp")
            local luasnip = require 'luasnip'
            return {
                    snippet = {
                        expand = function(args)
                            require("luasnip").lsp_expand(args.body)
                        end,
                    },
                    view = {
                        entries = { name = 'custom', selection_order = 'near_cursor' }
                    },
                    window = {
                        completion = cmp.config.window.bordered(),
                        documentation = cmp.config.window.bordered(),
                    },
                    formatting = {
                        format = require("lspkind").cmp_format({
                            mode = "symbol_text",
                            menu = ({
                                buffer = "[Buffer]",
                                nvim_lsp = "[LSP]",
                                luasnip = "[LuaSnip]",
                                latex_symbols = "[Latex]",
                            })
                        }),
                    },
                    mapping = cmp.mapping.preset.insert({
                        ['<C-d>'] = cmp.mapping.scroll_docs( -4), -- Up
                        ['<C-f>'] = cmp.mapping.scroll_docs(4), -- Down
                        ['<C-Space>'] = cmp.mapping.complete(),
                        ['<CR>'] = cmp.mapping.confirm {
                            behavior = cmp.ConfirmBehavior.Replace,
                            select = true,
                        },
                        ['<Tab>'] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            elseif luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                            else
                                fallback()
                            end
                        end, { 'i', 's' }),
                        ['<S-Tab>'] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            elseif luasnip.jumpable( -1) then
                                luasnip.jump( -1)
                            else
                                fallback()
                            end
                        end, { 'i', 's' }),
                    }),
                    sources = cmp.config.sources({
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                        { name = "buffer" },
                        { name = 'calc' },
                        { name = "path" },
                        { name = 'luasnip_choice' },
                        { name = 'latex_symbols' },
                        { name = 'git' },
                        { name = 'treesitter' }
                    }),
                },
                cmp.setup.filetype('zsh', {
                    sources = cmp.config.sources({
                        { name = 'zsh' },
                        { name = 'buffer' },
                        { name = 'buffer' },
                        { name = "nvim_lsp" },
                        { name = "luasnip" },

                    })
                })
        end,
    }
}

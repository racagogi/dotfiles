return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        opts = {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                always_divide_middle = false,
                globalstatus = true,
            },
            sections = {
                lualine_a = {
                    'fileformat',
                    'encoding',
                    'mode',
                },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'buffers'
                },
                lualine_x = {
                },
                lualine_y = {
                    'filetype',
                },
                lualine_z = {
                    'progress',
                    function()
                        local msg = 'No Active Lsp'
                        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                        local clients = vim.lsp.get_active_clients()
                        if next(clients) == nil then
                            return 'ﮤ ' .. msg
                        end
                        for _, client in ipairs(clients) do
                            local filetypes = client.config.filetypes
                            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                return 'ﮣ ' .. client.name
                            end
                        end
                    end,
                }
            },

            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {
                }
            },
            inactive_winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            extensions = {
                'nvim-tree',
                'symbols-outline'
            }
        }
    }
}

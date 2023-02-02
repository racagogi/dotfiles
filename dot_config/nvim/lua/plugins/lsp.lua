local servers = {
    "bashls",
    "ccls",
    "clojure_lsp",
    "cmake",
    "cssls",
    "elixirls",
    "elmls",
    "erlangls",
    "gopls",
    "hls",
    "html",
    "jdtls",
    "jsonls",
    "julials",
    "kotlin_language_server",
    "marksman",
    "metals",
    "omnisharp",
    "ocamllsp",
    "pyright",
    "racket_langserver",
    "rust_analyzer",
    "sorbet",
    "sumneko_lua",
    "taplo",
    "texlab",
    "tsserver",
    "vimls",
    "yamlls",
}
local opts = { noremap = true, silent = true }
return {
    { 'williamboman/mason.nvim',
        config = true,
    },
    { 'williamboman/mason-lspconfig.nvim',
        opts = {
            { exclude = { "hls" } }
        }
    },
    { 'neovim/nvim-lspconfig',
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
            local lspconfig = require 'lspconfig'
            for _, server in ipairs(servers) do
                if server == "sumneko_lua" then
                    lspconfig[server].setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { 'vim', 'use' }
                                }
                            }
                        }
                    }
                else
                    lspconfig[server].setup {
                        capabilities = capabilities,
                    }
                end
            end
        end,
        keys = {
            { '<space>f', function() vim.lsp.buf.format { async = true } end, opts },
            { "<space>a", vim.lsp.buf.code_action, opts },
            { "<space>n", vim.lsp.buf.rename, opts },
            { "<space>h", vim.lsp.buf.hover, opts },
            { "<space>s", vim.lsp.buf.signature_help, opts },
            { "<space>d", vim.lsp.buf.definition, opts },
            { '<space>D', vim.lsp.buf.declaration, opts },
            { "<space>i", vim.lsp.buf.implementation, opts },
            { '<space>t', vim.lsp.buf.type_definition, opts },
            { '<space>r', vim.lsp.buf.references, opts }
        }
    },
}

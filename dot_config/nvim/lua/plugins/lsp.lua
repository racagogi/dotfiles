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
    "svelte",
    "sumneko_lua",
    "taplo",
    "tailwindcss",
    "texlab",
    "tsserver",
    "volar",
    "vimls",
    "yamlls",
}
local opts = { noremap = true, silent = true }
return {
    {
        "williamboman/mason.nvim",
        config = true
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            automatic_installation = { exclude = { "hls" } },

        }
    },
    {
        "neovim/nvim-lspconfig",
        event = "BufRead",
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
            require("mason").setup()
            require("mason-lspconfig").setup()
            local lspconfig = require("lspconfig")
            for _, server in ipairs(servers) do
                if server == "sumneko_lua" then
                    lspconfig[server].setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "use" },
                                },
                            },
                        },
                    })
                else
                    lspconfig[server].setup({
                        capabilities = capabilities,
                    })
                end
            end
        end,
        keys = {
            {
                "<space>f",
                function()
                    vim.lsp.buf.format({ async = true })
                end,
                opts,
            },
            { "<space>a", vim.lsp.buf.code_action, opts },
            { "<space>n", vim.lsp.buf.rename, opts },
            { "<space>h", vim.lsp.buf.hover, opts },
            { "<space>s", vim.lsp.buf.signature_help, opts },
            { "<space>d", vim.lsp.buf.definition, opts },
            { "<space>D", vim.lsp.buf.declaration, opts },
            { "<space>i", vim.lsp.buf.implementation, opts },
            { "<space>t", vim.lsp.buf.type_definition, opts },
            { "<space>r", vim.lsp.buf.references, opts },
            { "]d", vim.diagnostic.goto_prev, opts },
            { "[d", vim.diagnostic.goto_next, opts },
        },
    },
    {
        "jayp0521/mason-null-ls.nvim",
        opts = {
            automatic_installation = true,
            automatic_setup = true,
        },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            null_ls.setup({
                sources = {
                    null_ls.builtins.diagnostics.cpplint,
                    null_ls.builtins.formatting.clang_format,
                    null_ls.builtins.formatting.joker,
                    null_ls.builtins.formatting.djlint,
                    null_ls.builtins.diagnostics.djlint,
                    null_ls.builtins.diagnostics.hadolint,
                    null_ls.builtins.formatting.elm_format,
                    null_ls.builtins.formatting.eslint_d,
                    null_ls.builtins.code_actions.eslint_d,
                    null_ls.builtins.diagnostics.eslint_d,
                    null_ls.builtins.diagnostics.curlylint,
                    null_ls.builtins.formatting.fixjson,
                    null_ls.builtins.formatting.ktlint,
                    null_ls.builtins.diagnostics.ktlint,
                    null_ls.builtins.diagnostics.markdownlint,
                    null_ls.builtins.formatting.markdownlint,
                    null_ls.builtins.formatting.cbfmt,
                    null_ls.builtins.diagnostics.vale,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.diagnostics.pylint,
                    null_ls.builtins.diagnostics.vulture,
                    null_ls.builtins.formatting.rubocop,
                    null_ls.builtins.formatting.yamlfmt,
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.formatting_sync()
                            end,
                        })
                    end
                end,
            })
        end,
    },
}

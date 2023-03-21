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
    "idris2_lsp",
    "jdtls",
    "jsonls",
    "julials",
    "kotlin_language_server",
    "marksman",
    "metals",
    "ocamllsp",
    "omnisharp",
    "prolog_ls",
    "pyright",
    "racket_langserver",
    "rust_analyzer",
    "sorbet",
    "svelte",
    "lua_ls",
    "taplo",
    "tailwindcss",
    "texlab",
    "tsserver",
    "volar",
    "vimls",
    "yamlls",
    "zls"
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
        dependencies = {
            'ray-x/lsp_signature.nvim',
            "folke/neodev.nvim",
            "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        },
        config = function()
            require("neodev").setup({})
            require("lsp_lines").setup()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
            vim.diagnostic.config({
                virtual_text = false,
            })
            local on_attach = function(_, bufnr)
                require "lsp_signature".on_attach({
                    bind = true,
                    hint_prefix = "𝚪 ",
                    handler_opts = {
                        border = "rounded",
                    }
                }, bufnr)
            end
            require("mason").setup()
            require("mason-lspconfig").setup()
            local lspconfig = require("lspconfig")
            for _, server in ipairs(servers) do
                if server == "lua_ls" then
                    lspconfig[server].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "use" },
                                },
                            },
                        },
                    })
                elseif server == "elixirls" then
                    lspconfig[server].setup({
                        cmd = { "/home/raca/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
                        on_attach = on_attach,
                        capabilities = capabilities,
                    })
                else
                    lspconfig[server].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
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
                desc = "formatting"
            },
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
    {
        "glepnir/lspsaga.nvim",
        event = "BufRead",
        config = function()
            require("lspsaga").setup({
                beacon = {
                    enable = false,
                },
                ui = {
                    theme = "round",
                    title = true,
                    border = "rounded",
                    winblend = 0,
                    expand = "",
                    collapse = "",
                    preview = " ",
                    code_action = "💡",
                    diagnostic = "🐞",
                    incoming = " ",
                    outgoing = " ",
                    hover = ' ',
                    kind = {},
                },
                symbol_in_winbar = {
                    enable = false,
                    separator = " ",
                    hide_keyword = true,
                    show_file = true,
                    folder_level = 2,
                    respect_root = false,
                    color_mode = true,
                },
            })
        end,
        keys = {
            { "<space>a", "<cmd>Lspsaga code_action<CR>",          opts, desc = "code action" },
            { "<space>n", "<cmd>Lspsaga rename<CR>",               opts, desc = "rename" },
            { "<space>h", "<cmd>Lspsaga hover_doc<CR>",            opts, desc = "hover doc" },
            { "<space>d", "<cmd>Lspsaga peek_definition<CR>",      opts, desc = "view defintion" },
            { "<space>D", "<cmd>Lspsaga goto_definition<CR>",      opts, desc = "go defintion" },
            { "<space>s", "<cmd>Lspsaga lsp_finder<CR>",           opts, desc = "search" },
            { "[d",       "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts, desc = "diagnostic_jump_prev" },
            { "]d",       "<cmd>Lspsaga diagnostic_jump_next<CR>", opts, desc = "diagnostic_jump_next" },
        },
        dependencies = { { "nvim-tree/nvim-web-devicons" } }
    },
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        keys = {
            { "<space>t", "<cmd>TroubleToggle<cr>", desc = "show trouble" },
        },
        config = function()
            require("trouble").setup {}
        end
    }
}

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
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = { exclude = { "hls" } }
})


local lspconfig = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
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

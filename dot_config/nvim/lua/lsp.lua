local lspconfig    = require 'lspconfig'
local lspkind      = require 'lspkind'
local enum         = require "enum"
local servers      = enum.lsp
local symbols      = enum.symbol
local luasnip      = require 'luasnip'
local cmp          = require 'cmp'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = {exclude = {"hls"}},
})
require('idris2').setup({})
require("luasnip.loaders.from_vscode").lazy_load()
require("cmp_dictionary").setup({
    dic = {
        spelllang = {
            en = "~/.config/nvim/en.dict",
        },
    },
    exact = 2,
    first_case_insensitive = false,
    document = false,
    document_command = "wn %s -over",
    async = false,
    capacity = 5,
    debug = false,
})

luasnip.snippets = require("luasnip_snippets").load_snippets()
require 'nvim-treesitter.configs'.setup {
    ensure_installed = 'all',
    sync_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true
    },
    parser_install_dir = "~/.treesitter",
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<F4>",
            node_incremental = "<C-f>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-d>",
        },
    },
}
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            symbol_map = symbols
        })
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>']     = cmp.mapping.scroll_docs(-4),
        ['<C-f>']     = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>']     = cmp.mapping.abort(),
        ['<CR>']      = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select   = true,
        },
        ['<Tab>']     = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>']   = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'calc' },
        { name = 'dictionary' },
        { name = 'digraphs' },
        { name = 'nvim_lsp_document_symbol' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'path' },
        { name = 'greek' },
        { name = 'latex_symbols' },
        { name = 'nvim_lua' },
    },
}

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },

    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources {
        { name = 'path' },
        { name = 'cmp-cmdline-history' },
        { name = 'cmdline' }, }

})


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

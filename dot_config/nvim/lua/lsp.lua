local lspinstaller = require "nvim-lsp-installer"
local lspkind      = require 'lspkind'
local lspconfig    = require 'lspconfig'
local enum         = require "enum"
local servers      = enum.lsp
local symbols      = enum.symbol
local luasnip      = require 'luasnip'
local cmp          = require 'cmp'
local saga         = require 'lspsaga'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

saga.init_lsp_saga()

saga.init_lsp_saga({
    border_style = "rounded",
    move_in_saga = { prev = '<C-p>',next = '<C-n>'},
    diagnostic_header = { " ", " ", " ", "ﴞ " },
    show_diagnostic_source = true,
    diagnostic_source_bracket = {},
    code_action_icon = "💡",
    code_action_num_shortcut = true,
    code_action_lightbulb = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
    },
    finder_separator = "  ",
    max_preview_lines = 10,
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = "q",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>", -- quit can be a table
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    rename_action_quit = "<C-c>",
    definition_preview_icon = "  ",
    symbol_in_winbar = false,
    winbar_separator = '>',
    winbar_show_file = true,
    server_filetype_map = {},
})

lspinstaller.setup {}
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.snippets = require("luasnip_snippets").load_snippets()
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "rust" },
    sync_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        colors = {
            "#ff85a8",
            "#FFAF43",
            "#FFCA0F",
            "#3eef73",
            "#00F1FF",
            "#a4c6ff",
        },
    }
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
            behavior  = cmp.ConfirmBehavior.Replace,
            select    = true,
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

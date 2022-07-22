local enum = require 'enum'
local symbol = enum.symbol
local folder = symbol.folder
local git = symbol.git
local types = enum.symbol.type
local status = enum.symbol.status
local glyps = enum.symbol.glyps
require("nvim-tree").setup { -- BEGIN_DEFAULT_OPTS
    disable_netrw           = true,
    auto_reload_on_write    = true,
    create_in_closed_folder = true,
    hijack_cursor           = true,
    reload_on_bufenter      = true,
    respect_buf_cwd         = true,
    view = {
        number = true,
        signcolumn = "yes",
        mappings = {
            custom_only = true,
            list = {
                { key = "<CR>", action = "edit" },
                { key = "<F5>", action = "refresh" },
                { key = "a", action    = "create" },
                { key = "d", action    = "remove" },
                { key = "r", action    = "rename" },
                { key = "q", action    = "close" },
                { key = "c", action    = "collapse_all" },
                { key = "e", action    = "expand_all" },
                { key = "i", action    = "toggle_file_info" },
            },
        },
    },
    renderer = {
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = status.symlink_arrow,
            glyphs = {
                default = status.default,
                symlink = status.symlink,
                folder = {
                    arrow_closed = folder.arrow_closed,
                    arrow_open   = folder.arrow_open,
                    default      = folder.default,
                    open         = folder.open,
                    empty        = folder.empty,
                    empty_open   = folder.empty_open,
                    symlink      = folder.symlink,
                    symlink_open = folder.symlink_open,
                },
                git = {
                    unstaged  = git.unstaged,
                    staged    = git.staged,
                    unmerged  = git.unmerged,
                    renamed   = git.renamed,
                    untracked = git.untracked,
                    deleted   = git.deleted,
                    ignored   = git.ignored,
                },
            },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = status.hint,
            info = status.info,
            warning = status.warning,
            error = status.error,
        },
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
}
require('gitsigns').setup {
    signs = {
        add          = { hl = 'GitSignsChange', text = git.untracked, numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change       = { hl = 'GitSignsChange', text = git.deleted, numhl = 'GitSignsChangeNr',
            linehl = 'GitSignsChangeLn' },
        delete       = { hl = 'GitSignsDelete', text = git.deleted, numhl = 'GitSignsDeleteNr',
            linehl = 'GitSignsDeleteLn' },
        topdelete    = { hl = 'GitSignsDelete', text = git.deleted, numhl = 'GitSignsDeleteNr',
            linehl = 'GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = git.deleted, numhl = 'GitSignsChangeNr',
            linehl = 'GitSignsChangeLn' },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
}
require('neogit').setup {
    mappings = {
        status = {
            ["u"] = "PushPopup",
            ["P"] = "",
        }
    }
}
-- init.lua
vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides            = true,
    auto_preview           = true,
    position               = 'right',
    relative_width         = true,
    width                  = 25,
    auto_close             = false,
    show_numbers           = false,
    show_relative_numbers  = false,
    show_symbol_details    = true,
    preview_bg_highlight   = 'Pmenu',
    keymaps = {
        close          = { "<Esc>", "q" },
        goto_location  = "<Cr>",
        focus_location = "o",
        hover_symbol   = "<C-space>",
        toggle_preview = "K",
        rename_symbol  = "r",
        code_actions   = "a",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
    symbols           = {
        File          = { icon = types.File, hl          = "TSURI" },
        Module        = { icon = types.Module, hl        = "TSNamespace" },
        Namespace     = { icon = types.Namespace, hl     = "TSNamespace" },
        Package       = { icon = types.Module, hl        = "TSNamespace" },
        Class         = { icon = types.Class, hl         = "TSType" },
        Method        = { icon = types.Method, hl        = "TSMethod" },
        Property      = { icon = types.Property, hl      = "TSMethod" },
        Field         = { icon = types.Field, hl         = "TSField" },
        Constructor   = { icon = types.Constructor, hl   = "TSConstructor" },
        Enum          = { icon = types.Enum, hl          = "TSType" },
        Interface     = { icon = types.Interface, hl     = "TSType" },
        Function      = { icon = types.Function, hl      = "TSFunction" },
        Variable      = { icon = types.Variable, hl      = "TSConstant" },
        Constant      = { icon = types.Constant, hl      = "TSConstant" },
        String        = { icon = types.Text, hl          = "TSString" },
        Number        = { icon = types.Text, hl          = "TSNumber" },
        Boolean       = { icon = types.Text, hl          = "TSBoolean" },
        Array         = { icon = types.Enum, hl          = "TSConstant" },
        Object        = { icon = types.Class, hl         = "TSType" },
        Key           = { icon = types.Keyword, hl       = "TSType" },
        Null          = { icon = types.Constant, hl      = "TSType" },
        EnumMember    = { icon = types.EnumMember, hl    = "TSField" },
        Struct        = { icon = types.Struct, hl        = "TSType" },
        Event         = { icon = types.Event, hl         = "TSType" },
        Operator      = { icon = types.Operator, hl      = "TSOperator" },
        TypeParameter = { icon = types.TypeParameter, hl = "TSParameter" }
    }
}

vim.g.tokyonight_colors = {
    comment   = "#1abc9c",
    fg_gutter = '#414868',
    bg_float  = '#24283b',
}
vim.g.tokyonight_style               = "night"
vim.g.tokyonight_italic_functions    = true
vim.g.tokyonight_italic_keywords     = true
vim.g.tokyonight_lualine_bold        = true
vim.g.tokyonight_transparent         = true
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_lualine_bold        = true

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'tokyonight',
        component_separators = { left = glyps.component_separators_left, right = glyps.component_separators_right },
        section_separators = { left = glyps.section_separators_left, right = glyps.section_separators_right },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype',
            function()
                local msg = 'No Active Lsp'
                local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                    return '〆' .. msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return '々' .. msg
            end
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = { 'nvim-tree' }
}

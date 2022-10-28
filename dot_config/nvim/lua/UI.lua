require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
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
    lualine_c = {
      'filetype',
    },
    lualine_x = {
    },
    lualine_y = {},
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
    lualine_a = {
      'buffers'
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
    }
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {
      'buffers'
    },
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

require("symbols-outline").setup({
  highlight_hovered_item = false,
  show_guides            = true,
  auto_preview           = false,
  position               = 'right',
  relative_width         = true,
  width                  = 25,
  auto_close             = true,
  show_numbers           = false,
  show_relative_numbers  = false,
  show_symbol_details    = true,
  preview_bg_highlight   = 'Pmenu',
  autofold_depth         = nil,
  auto_unfold_hover      = true,
  fold_markers           = { '', '' },
  wrap                   = false,
  keymaps                = {
    close          = "q",
    goto_location  = "<Cr>",
    focus_location = "o",
    hover_symbol   = "<space>h",
    rename_symbol  = "<space>r",
    code_actions   = "<space>a",
    fold           = "zc",
    unfold         = "zo",
    fold_all       = "zM",
    unfold_all     = "zR",
  },
  lsp_blacklist          = {},
  symbol_blacklist       = {},
  symbols                = {
    File          = { icon = "", hl = "TSURI" },
    Module        = { icon = "", hl = "TSNamespace" },
    Namespace     = { icon = "", hl = "TSNamespace" },
    Package       = { icon = "", hl = "TSNamespace" },
    Class         = { icon = "", hl = "TSType" },
    Method        = { icon = "", hl = "TSMethod" },
    Property      = { icon = "", hl = "TSMethod" },
    Field         = { icon = "", hl = "TSField" },
    Constructor   = { icon = "", hl = "TSConstructor" },
    Enum          = { icon = "", hl = "TSType" },
    Interface     = { icon = "", hl = "TSType" },
    Function      = { icon = "", hl = "TSFunction" },
    Variable      = { icon = "", hl = "TSConstant" },
    Constant      = { icon = "", hl = "TSConstant" },
    String        = { icon = "", hl = "TSString" },
    Number        = { icon = "", hl = "TSNumber" },
    Boolean       = { icon = "", hl = "TSBoolean" },
    Array         = { icon = "", hl = "TSConstant" },
    Object        = { icon = "", hl = "TSType" },
    Key           = { icon = " ", hl = "TSType" },
    Null          = { icon = "", hl = "TSType" },
    EnumMember    = { icon = "", hl = "TSField" },
    Struct        = { icon = "", hl = "TSType" },
    Event         = { icon = "", hl = "TSType" },
    Operator      = { icon = "", hl = "TSOperator" },
    TypeParameter = { icon = "", hl = "TSParameter" }
  }
})
require("nvim-tree").setup({
  disable_netrw = true
  , hijack_unnamed_buffer_when_opening = true
  , remove_keymaps = true
  , view = {
    number = true
    , mappings = {
      custom_only = true
      , list = {
        { key = "R", action = "refresh" },
        { key = "a", action = "create" },
        { key = "d", action = "remove" },
        { key = "r", action = "rename" },
        { key = "x", action = "cut" },
        { key = "c", action = "copy" },
        { key = "p", action = "paste" },
        { key = "y", action = "copy_absolute_path" },
        { key = "q", action = "close" },
        { key = "zc", action = "collapse_all" },
        { key = "zR", action = "expand_all" },
        { key = "i", action = "toggle_file_info" },
      }
    }
  }

})
require("icon-picker").setup({ disable_legacy_commands = true })
require('neogit').setup({
  mappings = {
    status = {
      ["f"] = "PushPopup",
      ["P"] = "",
    }
  }
})

require("iron.core").setup {
  config = {
    scratch_repl = true,
    repl_definition = { sh = {
      command = { "zsh" }
    }
      , lua = {
        command = { "luajit" }
      }
    },
    repl_open_cmd = require('iron.view').split.vertical.botright("50%")
  },
  keymaps = {
    send_motion = "gm",
    visual_send = "gv",
    send_file = "gf",
    send_line = "gl",
    exit = "<Leader>q",
    clear = "<Leader>c",
  },
  highlight = {
    italic = true
  }
}

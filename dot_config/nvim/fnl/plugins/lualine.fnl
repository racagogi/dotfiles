[{1 :nvim-lualine/lualine.nvim
  :dependencies [:nvim-tree/nvim-web-devicons]
  :event :VeryLazy
  :opts {:extensions [:nvim-tree :symbols-outline]
         :inactive_sections {:lualine_a {}
                             :lualine_b {}
                             :lualine_c {}
                             :lualine_x [:location]
                             :lualine_y {}
                             :lualine_z {}}
         :inactive_winbar {:lualine_a {}
                           :lualine_b {}
                           :lualine_c {}
                           :lualine_x {}
                           :lualine_y {}
                           :lualine_z {}}
         :options {:always_divide_middle false
                   :component_separators {:left "" :right ""}
                   :globalstatus true
                   :icons_enabled true
                   :section_separators {:left "" :right ""}
                   :theme :auto}
         :sections {:lualine_a [:fileformat :encoding :mode]
                    :lualine_b [:branch :diff :diagnostics]
                    :lualine_c [:buffers]
                    :lualine_x {}
                    :lualine_y [:filetype]
                    :lualine_z [:progress
                                (fn []
                                  (local msg "No Active Lsp")
                                  (local buf-ft
                                         (vim.api.nvim_buf_get_option 0 :filetype))
                                  (local clients (vim.lsp.get_active_clients))
                                  (when (= (next clients) nil)
                                    (let [lsp_status (.. "ﮤ " msg)]
                                      (lua "return lsp_status")))
                                  (each [_ client (ipairs clients)]
                                    (local filetypes client.config.filetypes)
                                    (when (and filetypes
                                               (not= (vim.fn.index filetypes buf-ft) (- 1)))
                                      (let [lsp_status (.. "ﮣ " client.name)]
                                        (lua "return lsp_status")))))]}
         :winbar {:lualine_a {}
                  :lualine_b {}
                  :lualine_c {}
                  :lualine_x {}
                  :lualine_y {}
                  :lualine_z {}}}}]

{1 :nvim-telescope/telescope.nvim
 :cmd :Telescope
 :dependencies [:nvim-tree/nvim-web-devicons]
 :keys [{1 :<leader>c 2 "<cmd>Telescope buffers<cr>" :desc :Buffers}
        {1 :<leader>a
         2 "<cmd>Telescope autocommands<cr>"
         :desc "Auto     Commands"}
        {1 :<leader>f
         2 "<cmd>Telescope current_buffer_fuzzy_find<cr>"
         :desc :Buffer}
        {1 :<leader>h
         2 "<cmd>Telescope highlights<cr>"
         :desc "Search   Highlight Groups"}
        {1 :<leader>k 2 "<cmd>Telescope keymaps<cr>" :desc "Key      Maps"}
        {1 :<leader>r 2 "<cmd>Telescope registers<cr>" :desc "Register find"}
        {1 :<leader>F
         2 "<cmd>Telescope find_files<cr>"
         :desc "File     Search"
         :mode [:n :i]}]
 :opts {:defaults {:mappings {:i {:<s-tab> (fn [...]
                                             ((. (require :telescope.actions)
                                                 :cycle_history_prev) ...))
                                  :<tab> (fn [...]
                                           ((. (require :telescope.actions)
                                               :cycle_history_next) ...))}}}}}

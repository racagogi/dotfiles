{1 :protex/better-digraphs.nvim
 :config (fn []
           (let [opts {:noremap true :silent true}
                 mappings [[:i :<M-2> "<Cmd>lua require'better-digraphs'.digraphs(\"insert\")<CR>" {:desc :diagraph}]
                           [:n :<M-2> "<Cmd>lua require'better-digraphs'.digraphs(\"noraml\")<CR>" {:desc :diagraph}]]]
             (each [_ mapping (ipairs mappings)]
               (match mapping [mode key cmd desc]
                (vim.api.nvim_set_keymap mode key cmd (vim.tbl_extend :force opts desc))))))}

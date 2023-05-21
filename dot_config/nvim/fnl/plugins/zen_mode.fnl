{1 :folke/zen-mode.nvim
 :config (λ []
            ((. (require :zen-mode) :setup)
             {})
            (let [opts {:noremap true :silent true}
                  mappings [[:i :<M-z> "<Cmd>ZenMode<CR>" {:desc :zen}]
                            [:n :<M-z> "<Cmd>ZenMode<CR>" {:desc :zen}]]]
             (each [_ mapping (ipairs mappings)]
               (match mapping [mode key cmd desc]
                (vim.api.nvim_set_keymap mode key cmd (vim.tbl_extend :force opts desc))))))}

(let [opts {:noremap true :silent true}
      mappings [[:n :<S-v> :<C-v> {:desc "Visual line"}]
                [:n :<C-s> ::wq<CR> {:desc :Save}]
                [:n :<C-q> ::qa<CR> {:desc :Quit}]
                [:n :j :gj {:desc :movedown}]
                [:n :k :gk {:desc :moveup}]
                [:n :<F5> ::w<CR> {:desc :save}]]]
  (each [_ mapping (ipairs mappings)]
       (match mapping
         [mode key cmd desc]
         (vim.api.nvim_set_keymap mode key cmd (vim.tbl_extend :force opts desc)))))

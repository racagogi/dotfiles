{1 :drybalka/tree-climber.nvim
 :config (fn []
          (let [opts {:noremap true :silent true}
                 mappings [[:i :<M-h> "<cmd>lua require('tree-climber').goto_parent()<cr>" {:desc "go parent"}]
                           [:i :<M-l> "<cmd>lua require('tree-climber').goto_child()<cr>"  {:desc "go child"}]
                           [:i :<M-j> "<cmd>lua require('tree-climber').goto_next()<cr>"   {:desc "go next"}]
                           [:i :<M-k> "<cmd>lua require('tree-climber').goto_prev()<cr>"   {:desc "go prev"}]
                           [:n :<M-h> "<cmd>lua require('tree-climber').goto_parent()<cr>" {:desc "go parent"}]
                           [:n :<M-l> "<cmd>lua require('tree-climber').goto_child()<cr>"  {:desc "go child"}]
                           [:n :<M-j> "<cmd>lua require('tree-climber').goto_next()<cr>"   {:desc "go next"}]
                           [:n :<M-k> "<cmd>lua require('tree-climber').goto_prev()<cr>"   {:desc "go prev"}]
                           [:o :<M-h> "<cmd>lua require('tree-climber').goto_parent()<cr>" {:desc "go parent"}]
                           [:o :<M-l> "<cmd>lua require('tree-climber').goto_child()<cr>"  {:desc "go child"}]
                           [:o :<M-j> "<cmd>lua require('tree-climber').goto_next()<cr>"   {:desc "go next"}]
                           [:o :<M-k> "<cmd>lua require('tree-climber').goto_prev()<cr>"   {:desc "go prev"}]]]
             (each [_ mapping (ipairs mappings)]
               (match mapping [mode key cmd desc]
                (vim.api.nvim_set_keymap mode key cmd (vim.tbl_extend :force opts desc))))))}

{1 :nvim-neorg/neorg
 :build ":Neorg sync-parsers"
 :config (fn []
           (set vim.opt.autochdir true)
           ((. (require :neorg) :setup)
            {:load
             {:core.defaults {}
              :core.export {}
              :core.export.markdown {}
              :core.integrations.nvim-cmp {}
              :core.integrations.telescope {}
              :core.keybinds
               {:config
                {:default_keybinds false
                 :hook (fn [keybinds]
                         (keybinds.remap_event :norg :n :gc :core.looking-glass.magnify-code-block)
                         (keybinds.remap_event :norg :n :gtd :core.norg.qol.todo_items.todo.task_done)
                         (keybinds.remap_event :norg :n :gtu :core.norg.qol.todo_items.todo.task_undone)
                         (keybinds.remap_event :norg :n :gtp :core.norg.qol.todo_items.todo.task_pending)
                         (keybinds.remap_event :norg :n :gth :core.norg.qol.todo_items.todo.task_on_hold)
                         (keybinds.remap_event :norg :n :gtc :core.norg.qol.todo_items.todo.task_cancelled)
                         (keybinds.remap_event :norg :n :gtr :core.norg.qol.todo_items.todo.task_recurring)
                         (keybinds.remap_event :norg :n :gti :core.norg.qol.todo_items.todo.task_important)
                         (keybinds.remap_event :norg :n :gs :core.norg.qol.todo_items.todo.task_cycle)
                         (keybinds.remap_event :norg :n :gj :core.promo.promote)
                         (keybinds.remap_event :norg :n :gk :core.promo.demote)
                         (keybinds.remap_event :norg :n :go :core.itero.next-iteration)
                         (keybinds.remap_event :norg :n :gl :core.norg.esupports.hop.hop-link)
                         (keybinds.remap_event :norg :n :<leader>lf :core.integrations.telescope.insert_file_link)
                         (keybinds.remap_event :norg :n :<leader>ll :core.integrations.telescope.insert_link)
                         (keybinds.remap_event :norg :i :<leader>lf :core.integrations.telescope.insert_file_link)
                         (keybinds.remap_event :norg :i :<leader>ll :core.integrations.telescope.insert_link))}}
              :core.norg.completion {:config {:engine :nvim-cmp
                                              :name "[Neorg]"}}
              :core.norg.concealer {}
              :core.norg.dirman {:config {:default_workspace :danish
                                          :workspaces {:danish "~/.mind/data"}}}}}))
 :dependencies [[:nvim-lua/plenary.nvim] [:nvim-neorg/neorg-telescope]]}

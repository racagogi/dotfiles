{1 :nvim-treesitter/nvim-treesitter
 :build ":TSUpdate"
 :config (fn [_ opts]
         (set vim.g.matchup_matchparen_offscreen {:method :popup}) 
         ( (. (require :nvim-treesitter.configs) :setup) opts))
 :dependencies [:mrjones2014/nvim-ts-rainbow
                :JoosepAlviste/nvim-ts-context-commentstring
                :windwp/nvim-ts-autotag
                :andymass/vim-matchup
                :nvim-treesitter/playground]
 :event :BufReadPost
 :keys [{1 :<F6> 2 :<cmd>TSPlaygroundToggle<cr> :mode [:n]}
        {1 :<M-h> 2 :<cmd>TSHighlightCapturesUnderCursor<cr> :mode [:n]}
        {1 :<M-d> 2 :<cmd>TSNodeUnderCursor<cr> :mode [:n]}]
 :opts {:butotag {:enable true}
        :context_commentstring {:enable true :enable_autocmd false}
        :ensure_installed :all
        :highlight {:enable true}
        :incremental_selection {:enable true
                                :keymaps {:init_selection :<M-s>
                                          :node_decremental :<M-d>
                                          :node_incremental :<M-f>}}
        :indent {:enable true}
        :matchup {:enable true}
        :playground {:enable true
                     :keybindings {:focus_language :f
                                   :goto_node :<cr>
                                   :show_help "?"
                                   :toggle_anonymous_nodes :a
                                   :toggle_hl_groups :h
                                   :toggle_injected_languages :i
                                   :toggle_language_display :I
                                   :toggle_query_editor :q
                                   :unfocus_language :F
                                   :update :R}
                     :persist_queries false
                     :updatetime 25}
        :rainbow {:enable true :extended_mode true}
        :sync_install true}}  

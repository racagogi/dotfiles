{1 :ellisonleao/gruvbox.nvim
 :config (fn []
           ((. (require :gruvbox) :setup) {:bold true
                                           :contrast :soft
                                           :dim_inactive false
                                           :inverse true
                                           :invert_intend_guides false
                                           :invert_selection false
                                           :invert_signs false
                                           :invert_tabline false
                                           :italic {:comments true
                                                    :folds true
                                                    :operators false
                                                    :strings true}
                                           :overrides {}
                                           :palette_overrides {}
                                           :strikethrough true
                                           :transparent_mode false
                                           :undercurl true
                                           :underline true})
           (vim.cmd "            set background=light
            colorscheme gruvbox
            "))}

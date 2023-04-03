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
                                                    :strings false}
                                           :overrides {}
                                           :palette_overrides {}
                                           :strikethrough true
                                           :transparent_mode false
                                           :undercurl true
                                           :underline true})
           (set vim.opt.background :light)
           (vim.cmd.colorscheme :gruvbox))}

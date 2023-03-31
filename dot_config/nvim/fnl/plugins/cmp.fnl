{1 :hrsh7th/nvim-cmp
 :dependencies {1 :hrsh7th/cmp-nvim-lsp
                2 :onsails/lspkind.nvim
                3 :hrsh7th/cmp-buffer
                4 :hrsh7th/cmp-path
                5 :saadparwaiz1/cmp_luasnip
                6 :doxnit/cmp-luasnip-choice
                7 :hrsh7th/cmp-calc
                8 :petertriho/cmp-git
                9 :tamago324/cmp-zsh
                10 :ray-x/cmp-treesitter
                11 :kdheepak/cmp-latex-symbols
                :config (fn []
                          ((. (require :cmp_luasnip_choice) :setup) {:auto_open true}))}
 :event :InsertEnter
 :config (fn []
           (local cmp (require :cmp))
           (local luasnip (require :luasnip))
           (cmp.setup {:formatting {:format ((. (require :lspkind) :cmp_format)
                                             {:mode :symbol_text
                                              :menu {:buffer "[Buffer]"
                                                     :latex_symbols "[Latex]"
                                                     :luasnip "[LuaSnip]"
                                                     :neorg "[neorg]"}})}
                       :snippet {:expand (fn [args]
                                           ((. luasnip :lsp_expand) (. args :body)))}
                       :sources (cmp.config.sources [{:name :nvim_lsp}
                                                     {:name :luasnip}
                                                     {:name :buffer}
                                                     {:name :calc}
                                                     {:name :path}
                                                     {:name :luasnip_choice}
                                                     {:name :latex_symbols}
                                                     {:name :git}
                                                     {:name :treesitter}])
                       :mapping (cmp.mapping.preset.insert {:<C-Space> (cmp.mapping.complete)
                                                            :<C-d> (cmp.mapping.scroll_docs (- 4))
                                                            :<C-f> (cmp.mapping.scroll_docs 4)
                                                            :<CR> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Replace
                                                                                        :select true})
                                                            :<S-Tab> (cmp.mapping (fn [fallback]
                                                                                    (if (cmp.visible)
                                                                                        (cmp.select_prev_item)
                                                                                        (if (luasnip.jumpable (- 1))
                                                                                            (luasnip.jump (- 1))
                                                                                            (fallback))))
                                                                                  [:i :s])
                                                            :<Tab> (cmp.mapping (fn [fallback]
                                                                                    (if (cmp.visible)
                                                                                        (cmp.select_next_item)
                                                                                        (if (luasnip.expand_or_jumpable)
                                                                                            (luasnip.expand_or_jump)
                                                                                            (fallback))))
                                                                                [:i :s])})
                       :view {:entries {:name :custom :selection_order :near_cursor}}
                       :window {:completion (cmp.config.window.bordered)
                                :documentation (cmp.config.window.bordered)}})
           (cmp.setup.filetype :zsh
                               {:sources (cmp.config.sources [{:name :zsh}
                                                              {:name :buffer}
                                                              {:name :nvim_lsp}
                                                              {:name :luasnip}])})
           (cmp.setup.filetype :toml
                                  {:sources (cmp.config.sources [{:name :buffer}
                                                                 {:name :nvim_lsp}
                                                                 {:name :crates}])})
           (cmp.setup.filetype :norg
                               {:sources (cmp.config.sources [{:name :buffer}
                                                              {:name :nvim_lsp}
                                                              {:name :neorg}
                                                              {:name :luasnip}
                                                              {:name :luasnip_choice}
                                                              {:name :latex_symbols}
                                                              {:name :treesitter}
                                                              {:name :calc}
                                                              {:name :path}
                                                              {:name :git}])}))}

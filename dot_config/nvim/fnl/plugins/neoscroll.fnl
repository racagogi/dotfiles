{1 :karb94/neoscroll.nvim
 :config (fn []
           ((. (require :neoscroll) :setup) {:cursor_scrolls_alone true
                                             :easing_function ""
                                             :hide_cursor true
                                             :mappings [:<C-u>
                                                        :<C-d>
                                                        :<C-b>
                                                        :<C-f>
                                                        :<C-y>
                                                        :<C-e>
                                                        :zt
                                                        :zz
                                                        :zb]
                                             :performance_mode false
                                             :post_hook nil
                                             :pre_hook nil
                                             :respect_scrolloff false
                                             :stop_eof true}))}

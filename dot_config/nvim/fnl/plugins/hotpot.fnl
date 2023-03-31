{1 :rktjmp/hotpot.nvim
 :config (fn []
           ((. (require :hotpot) :setup) 
            {:compiler {:macros {:env :_COMPILER}
                        :modules {}}
             :enable_hotpot_diagnostics true
             :provide_require_fennel false}))}

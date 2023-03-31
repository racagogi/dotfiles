{1 :hkupty/iron.nvim
  :config (fn []
            ((. (require :iron.core) :setup)
             {:config
              {:repl_definition {:lua {:command [:luajit]}
                                 :sh {:command [:zsh]}}
               :repl_open_cmd ((. (. (. (require :iron.view)
                                        :split)
                                     :vertical)
                                  :botright) "50%")
               :scratch_repl true}
              :highlight {:italic true}
              :keymaps {:clear :<Leader>c
                        :exit :<Leader>q
                        :send_file :<Leader>f
                        :send_line :<Leader>l
                        :send_motion :<leader>m
                        :visual_send :<Leader>v}}))
  :keys [{1 :<F4> 2 :<cmd>IronRepl<cr> :desc :repl}]}

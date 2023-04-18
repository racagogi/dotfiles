{1 :nguyenvukhang/nvim-toggler
 :config (λ []
            ((. (require :nvim-toggler) :setup)
             {:inverses
              {:#t :#t
               :true :false}}
             :remove_default_keybinds true)
            (vim.keymap.set [:n :v] :<M-t>
                            (. (require :nvim-toggler) :toggle)))}

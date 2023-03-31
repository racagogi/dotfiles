{1 :saecki/crates.nvim
 :config (fn []
           ((. (require :crates) :setup)
            {:null_ls {:enabled true
                       :name :crates.nvim}}))
 :event "BufEnter *.toml"
 :lazy true}

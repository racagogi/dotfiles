{1 :nvim-tree/nvim-tree.lua
   :event :VimEnter
   :dependencies [:nvim-tree/nvim-web-devicons]
   :keys [{1 :<F1>
           2 ":NvimTreeToggle<CR>" :desc "nvim tree"}]
   :config (λ []
              (fn on-attach [bufnr]
                (let [api (require :nvim-tree.api)]
                 (fn opts [desc]
                  {:buffer bufnr
                   :desc (.. :nvim-tree desc)
                   :noremap true
                   :silent true})
                 (vim.keymap.set :n :<CR> api.node.open.edit (opts :Open))
                 (vim.keymap.set :n :R api.tree.reload (opts :Refresh))
                 (vim.keymap.set :n :a api.fs.create (opts :Create))
                 (vim.keymap.set :n :d api.fs.remove (opts :Delete))
                 (vim.keymap.set :n :r api.fs.rename (opts :Rename))
                 (vim.keymap.set :n :x api.fs.cut (opts :Cut))
                 (vim.keymap.set :n :c api.fs.copy.node (opts :Copy))
                 (vim.keymap.set :n :p api.fs.paste (opts :Paste))
                 (vim.keymap.set :n :y api.fs.copy.absolute_path (opts "Copy Absolute Path"))
                 (vim.keymap.set :n :q api.tree.close (opts :Close))
                 (vim.keymap.set :n :zc api.tree.collapse_all (opts :Collapse))
                 (vim.keymap.set :n :zR api.tree.expand_all (opts "Expand All"))
                 (vim.keymap.set :n :i api.node.show_info_popup (opts :Info))))
              ((. (require :nvim-tree) :setup) {:on_attach on-attach}))}

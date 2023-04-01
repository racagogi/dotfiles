{1 "wintermute-cell/gitignore.nvim"
 :config (λ []
          (let [gitignore (require :gitignore)]
           (vim.keymap.set "n" "<M-3>" gitignore.generate)))}

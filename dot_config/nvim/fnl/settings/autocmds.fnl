;; Autocommands for nvim.
(local autocmds
       [[:FileType]
        {:pattern :rkt
         :callback (fn []
                     (set vim.filetype :racket))}
        [:FileType
         {:pattern :prolog
          :callback (fn []
                      (set vim.filetype :prolog))}]
        [:FileType
         {:pattern :idris2
          :callback (fn []
                      (set vim.filetype :idris2))}]])

(each [_ autocmd (ipairs autocmds)]
  (match autocmd
    [event opts] (vim.api.nvim_create_autocmd event opts)))

{1 :rktjmp/highlight-current-n.nvim
 :config (fn []
           (let [opts {:noremap true :silent true}
                 mappings [[:n :N "<Plug>(highlight-current-n-N)" {:desc :next}]
                           [:n :n "<Plug>(highlight-current-n-n)" {:desc :prev}]]
                 cshl (vim.api.nvim_create_augroup :ClearSearchHL {:clear true})]
                (each [_ mapping (ipairs mappings)]
                   (match mapping
                     [mode key cmd desc]
                     (vim.api.nvim_set_keymap mode key cmd (vim.tbl_extend :force opts desc))))
                (vim.cmd " augroup ClearSearchHL
                           autocmd!
                           autocmd CmdlineEnter /,\\? set hlsearch
                           autocmd CmdlineLeave /,\\? set nohlsearch
                           autocmd CmdlineLeave /,\\? lua require('highlight_current_n')['/,?']()
                           augroup END ")
                ((. (require :highlight_current_n) :setup) {:highlight_group :IncSearch})))}

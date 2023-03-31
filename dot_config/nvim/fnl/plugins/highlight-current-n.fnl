{1 :rktjmp/highlight-current-n.nvim
 :config (fn []
           (vim.cmd "            nmap * *N
            nmap n <Plug>(highlight-current-n-n)
            nmap N <Plug>(highlight-current-n-N)
            augroup ClearSearchHL
            autocmd!
            autocmd CmdlineEnter /,\\? set hlsearch
            autocmd CmdlineLeave /,\\? set nohlsearch
            autocmd CmdlineLeave /,\\? lua require('highlight_current_n')['/,?']()
            augroup END
            ")
           ((. (require :highlight_current_n) :setup) {:highlight_group :IncSearch}))}

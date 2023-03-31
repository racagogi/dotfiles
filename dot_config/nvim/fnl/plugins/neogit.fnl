{1 :TimUntersberger/neogit
  :config (fn []
            (vim.cmd "hi NeogitNotificationInfo guifg=#98971a")
            (vim.cmd "hi NeogitNotificationWarning guifg=#d79921")
            (vim.cmd "hi NeogitNotificationError guifg=#cc241d")
            ((. (require :neogit) :setup) {:mappings {:status {:P ""
                                                               :f :PushPopup}}}))
  :dependencies [:nvim-lua/plenary.nvim]
  :keys [{1 :<F3> 2 :<cmd>Neogit<CR> :desc :neogit}]}

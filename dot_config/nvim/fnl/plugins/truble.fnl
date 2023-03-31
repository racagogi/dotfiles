{1 :folke/trouble.nvim
 :config (fn []
           ((. (require :trouble) :setup) {}))
 :dependencies [:nvim-tree/nvim-web-devicons]
 :keys [{1 :<space>t 2 :<cmd>TroubleToggle<cr> :desc "show trouble"}]}

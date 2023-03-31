{1 :chrisgrieser/nvim-various-textobjs
 :config (fn []
           (local keymap vim.keymap.set)
           (local vt (require :various-textobjs))
           (keymap [:o :x] :iw (fn [] (vt.subword true)))
           (keymap [:o :x] :aw (fn [] (vt.subword false)))
           (keymap [:o :x] :aa (fn [] (vt.entireBuffer)))
           (vt.setup {:useDefaultKeymaps false}))}

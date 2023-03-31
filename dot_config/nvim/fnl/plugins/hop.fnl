(local keyopts {:noremap true :silent true})
{1 :phaazon/hop.nvim
 :config true
 :keys [{1 :<M-v> 2 :<cmd>HopVertical<cr> 3 keyopts :mode [:n :v :o]}
        {1 :<M-p> 2 :<cmd>HopPattern<cr> 3 keyopts :mode [:n :v :o]}
        {1 :<M-w> 2 :<cmd>HopWord<cr> 3 keyopts :mode [:n :v :o]}
        {1 :f
         2 (fn []
             (local hop (require :hop))
             (local directions (. (require :hop.hint) :HintDirection))
             (hop.hint_char1 {:direction directions.AFTER_CURSOR}))
         3 keyopts
         :mode [:n :v :o]}
        {1 :F
         2 (fn []
             (local hop (require :hop))
             (local directions (. (require :hop.hint) :HintDirection))
             (hop.hint_char1 {:direction directions.BEFORE_CURSOR}))
         3 keyopts
         :mode [:n :v :o]}
        {1 :t
         2 (fn []
             (local hop (require :hop))
             (local directions (. (require :hop.hint) :HintDirection))
             (hop.hint_char1 {:direction directions.AFTER_CURSOR
                              :hint_offset (- 1)}))
         3 keyopts
         :mode [:n :v :o]}
        {1 :T
         2 (fn []
             (local hop (require :hop))
             (local directions (. (require :hop.hint) :HintDirection))
             (hop.hint_char1 {:direction directions.BEFORE_CURSOR
                              :hint_offset 1}))
         3 keyopts
         :mode [:n :v :o]}]}

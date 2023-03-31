{1 :norcalli/nvim-colorizer.lua
  :config (fn []
            ((. (require :colorizer) :setup)
             ["*"]
             {:RGB      true
              :RRGGBB   true
              :RRGGBBAA true
              :css      true
              :css_fn   true
              :hsl_fn   true
              :name     false
              :rgb_fn   true}))}

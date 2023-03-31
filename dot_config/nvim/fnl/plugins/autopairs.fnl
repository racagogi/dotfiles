{1 :windwp/nvim-autopairs
 :event :BufEnter
 :config (fn []
           (let [opts {:enable_check_bracket_line true
                       :fast_wrap {:chars ["{" "[" "(" "\"" "'"]
                                   :check_comma true
                                   :end_key "$"
                                   :highlight :Search
                                   :highlight_grey :Comment
                                   :keys :qwertyuiopzxcvbnmasdfghjkl
                                   :map :<M-w>
                                   :pattern "[%'%\"%>%]%)%}%,]"}}
                 autopairs (require :nvim-autopairs)]
                ((. autopairs :setup) opts)
                (tset (. ((. autopairs :get_rule) "'") 1) :not_filetypes
                        [:scheme :lisp :racket :fennel])))}

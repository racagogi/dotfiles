{1 :racagogi/mind.nvim
 :config (fn []
           ((. (require :mind) :setup)
            {:edit {:copy_link_format "[](%s)"
                    :data_extension :.norg
                    :data_header "* %s"}
             :keymaps {:normal {:/ :select_path
                                :<cr> :open_data
                                :<s-cr> :open_data_index
                                :<s-tab> :toggle_node
                                :<tab> :toggle_node
                                :D :delete_file
                                :I :add_inside_start
                                :L :copy_node_link_index
                                :O :add_above
                                :R :change_icon
                                :c :add_inside_end_index
                                :d :delete
                                :i :add_inside_end
                                :l :copy_node_link
                                :m :change_icon_menu
                                :o :add_below
                                :q :quit
                                :r :rename
                                :s :select
                                :t (fn [args]
                                     ((. (require :mind.ui) :with_cursor)
                                      (fn [line]
                                         (local tree
                                                (args.get_tree))
                                         (local node
                                                ((. (require :mind.node)
                                                    :get_node_by_line)
                                                 tree line))
                                         (if (or (= node.icon
                                                    nil)
                                                 (= node.icon
                                                    " "))
                                             (set node.icon
                                                  " ")
                                             (= node.icon
                                                " ")
                                             (set node.icon
                                                  " ")
                                             (= node.icon
                                                " ")
                                             (set node.icon
                                                  " "))
                                         (args.save_tree)
                                         ((. (require :mind.ui)
                                             :rerender) tree args.opts))))
                                :u :make_url}
                       :selection {:/ :select_path
                                   :<cr> :open_data
                                   :<s-tab> :toggle_node
                                   :I :move_inside_start
                                   :O :move_above
                                   :i :move_inside_end
                                   :o :move_below
                                   :q :quit
                                   :x :select}}
             :persistence {:data_dir "~/.mind/data"
                           :state_path "~/.mind/index.json"}}))
 :keys [{1 :gm 2 ":lua require 'mind'.open_main()<cr>" :desc "open main"}
        {1 :gp
         2 ":lua require 'mind'.open_project(true)<cr>"
         :desc "open local"}
        [:gc ":lua require 'mind'.close() <cr>"]]}

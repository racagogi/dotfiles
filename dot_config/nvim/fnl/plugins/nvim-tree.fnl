{1 :nvim-tree/nvim-tree.lua
  :dependencies [:nvim-tree/nvim-web-devicons]
  :keys [{1 :<F1>
          2 ":NvimTreeToggle<CR>" :desc "nvim tree"}]
  :opts {:disable_netrw true
         :hijack_unnamed_buffer_when_opening true
         :remove_keymaps true
         :view {:mappings
                {:custom_only true
                 :list [{:action           :edit :key :<CR>}
                        {:action :refresh            :key  :R}
                        {:action :create             :key  :a}
                        {:action :remove             :key  :d}
                        {:action :rename             :key  :r}
                        {:action :cut                :key  :x}
                        {:action :copy               :key  :c}
                        {:action :paste              :key  :p}
                        {:action :copy_absolute_path :key  :y}
                        {:action :close              :key  :q}
                        {:action :collapse_all       :key  :zc}
                        {:action :expand_all         :key  :zR}
                        {:action :toggle_file_info   :key  :i}]}
                :number false}}}

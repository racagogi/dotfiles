(local servers [:bashls
                :ccls
                :clojure_lsp
                :cssls
                :elixirls
                :elmls
                :gopls
                :graphql
                :hls
                :html
                :idris2_lsp
                :jdtls
                :jsonls
                :julials
                :kotlin_language_server
                :marksman
                :metals
                :omnisharp
                :ocamllsp
                :prolog_ls
                :pyright
                :racket_langserver
                :rust_analyzer
                :sorbet
                :svelte
                :fennel_language_server
                :lua_ls
                :taplo
                :tailwindcss
                :texlab
                :tsserver
                :volar
                :vimls
                :lemminx
                :yamlls
                :zls])
(local opts {:noremap true :silent true})
{1 :neovim/nvim-lspconfig
 :config (fn []
           ((. (require :neodev) :setup) {})
           ((. (require :lsp_lines) :setup))
           (var capabilities (vim.lsp.protocol.make_client_capabilities))
           (set capabilities
                ((. (require :cmp_nvim_lsp) :default_capabilities) capabilities))
           (vim.diagnostic.config {:virtual_text false})

           (fn on-attach [_ bufnr]
             ((. (require :lsp_signature) :on_attach) {:bind true
                                                       :handler_opts {:border :rounded}
                                                       :hint_prefix "𝚪 "}
                                                      bufnr))

           ((. (require :mason) :setup))
           ((. (require :mason-lspconfig) :setup))
           (local lspconfig (require :lspconfig))
           (each [_ server (ipairs servers)]
             (if (= server :lua_ls)
                 ((. (. lspconfig server) :setup) {: capabilities
                                                   :on_attach on-attach
                                                   :settings {:Lua {:diagnostics {:globals [:vim
                                                                                            :use]}}}})
                 (= server :elixirls)
                 ((. (. lspconfig server) :setup) {: capabilities
                                                   :cmd [:/home/raca/.local/share/nvim/mason/packages/elixir-ls/language_server.sh]
                                                   :on_attach on-attach})
                 (= server :racket_langserver)
                 ((. (. lspconfig server) :setup) {:filetypes [:racket]})
                 (= server :fennel_language_server)
                 ((. (. lspconfig server) :setup) {:root_dir (lspconfig.util.root_pattern :fnl)
                                                   :settings {:fennel {:diagnostics {:globals [:vim]}
                                                                       :workspace {:library (vim.api.nvim_list_runtime_paths)}}}})
                 ((. (. lspconfig server) :setup) {: capabilities
                                                   :on_attach on-attach})))
           (set vim.opt.hlsearch true)
           (vim.cmd.autocmd "BufRead * :echo \"hello \" "))
 :dependencies [:ray-x/lsp_signature.nvim
                :folke/neodev.nvim
                "https://git.sr.ht/~whynothugo/lsp_lines.nvim"]
 :event :BufRead
 :keys [{1 :<space>f
         2 (fn [] (vim.lsp.buf.format {:async true}))
         3 opts
         :desc :formatting}
        {1 :<space>a
         2 (fn [] (vim.lsp.buf.code_action))
         3 :opts
         :desc "code action"}
        {1 :<space>n 2 (fn [] (vim.lsp.buf.rename)) 3 opts :desc :rename}
        {1 :<space>h 2 (fn [] (vim.lsp.buf.hover)) 3 opts :desc "hover doc"}
        {1 :<space>d
         2 (fn [] (vim.lsp.buf.definition))
         3 opts
         :desc "view defintion"}
        {1 :<space>D
         2 (fn [] (vim.lsp.buf.declaration))
         3 opts
         :desc "go defintion"}
        {1 :<space>s
         2 (fn [] (vim.lsp.buf.signature_help))
         3 opts
         :desc :search}
        {1 "[d"
         2 (fn [] (vim.diagnostic.goto_prev {}))
         3 opts
         :desc :diagnostic_jump_prev}
        {1 "]d"
         2 (fn [] (vim.diagnostic.goto_next {}))
         3 opts
         :desc :diagnostic_jump_next}]}

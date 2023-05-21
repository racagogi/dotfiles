{1 :jose-elias-alvarez/null-ls.nvim
 :config (fn []
           (local null-ls (require :null-ls))
           (local augroup (vim.api.nvim_create_augroup :LspFormatting {}))
           (null-ls.setup {:on_attach (fn [client bufnr]
                                        (when (client.supports_method :textDocument/formatting)
                                          (vim.api.nvim_clear_autocmds
                                           {:buffer bufnr
                                            :group augroup})
                                          (vim.api.nvim_create_autocmd
                                            :BufWritePre
                                            {:buffer bufnr
                                             :callback (fn [] (vim.lsp.buf.formatting_sync {} 100))
                                             :group augroup})))
                           :sources [
                                     null-ls.builtins.formatting.joker
                                     null-ls.builtins.formatting.djlint
                                     null-ls.builtins.diagnostics.djlint
                                     null-ls.builtins.diagnostics.hadolint
                                     null-ls.builtins.formatting.elm_format
                                     null-ls.builtins.formatting.eslint_d
                                     null-ls.builtins.code_actions.eslint_d
                                     null-ls.builtins.diagnostics.eslint_d
                                     null-ls.builtins.diagnostics.curlylint
                                     null-ls.builtins.formatting.fixjson
                                     null-ls.builtins.formatting.ktlint
                                     null-ls.builtins.diagnostics.ktlint
                                     null-ls.builtins.diagnostics.markdownlint
                                     null-ls.builtins.formatting.markdownlint
                                     null-ls.builtins.formatting.cbfmt
                                     null-ls.builtins.formatting.black
                                     null-ls.builtins.diagnostics.vulture
                                     null-ls.builtins.formatting.rubocop
                                     null-ls.builtins.formatting.yamlfmt]}))}

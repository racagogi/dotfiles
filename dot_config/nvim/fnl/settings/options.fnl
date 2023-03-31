(fn apply-opts [opts]
  (each [k v (pairs opts)]
    (tset vim.opt k v)))

(local opts
       {:swapfile      false
        :backup        false
        :autoread      true

        :autoindent    true
        :cindent       true
        :expandtab     true
        :tabstop       4
        :shiftwidth    4
        :smarttab      true

        :hlsearch      true
        :incsearch     true
        :ignorecase    true
        :smartcase     true

        :cursorline    true
        :linebreak     true
        :list          true
        :listchars     "tab:>>="

        :showbreak     :<>
        :wrap          true
        :number        true
        :showmatch     true

        :clipboard     :unnamedplus
        :termguicolors true
        :shell         :zsh
        :mouse         ""})

(apply-opts opts)
(vim.opt.nrformats:append "alpha,octal")
(vim.opt.matchpairs:append "<:>")

 set termguicolors
 set noswapfile
 set nobackup
 set autoindent
 set autoread
 set clipboard=unnamedplus
 set mouse=
 set cursorline
 set hlsearch
 set ignorecase
 set incsearch
 set list
 set matchpairs+=<:>
 set nrformats=alpha,octal,hex,bin
 set number
 set shiftwidth=2
 set tabstop=2
 set showmatch
 set smartcase
 set smarttab
 set startofline
 set wrap
 set linebreak
 set showbreak=+++\

  lua require 'plugins'
  lua require 'lsp'
  lua require 'sitter'
  lua require 'util'
  lua require 'snip'
  lua require 'UI'
  lua require 'theme'
  lua require 'keymap'
  lua require 'nonconfig'
  colorscheme tokyonight
  highlight rainbowcol1 guifg=#f7768e
  highlight rainbowcol2 guifg=#ff9e64
  highlight rainbowcol3 guifg=#e0af68
  highlight rainbowcol4 guifg=#9ece6a
  highlight rainbowcol5 guifg=#2ac3de
  highlight rainbowcol6 guifg=#7aa2f7
  highlight rainbowcol7 guifg=#bb9af7
  highlight IndentBlanklineIndent1 guifg=#f7768e
  highlight IndentBlanklineIndent2 guifg=#ff9e64
  highlight IndentBlanklineIndent3 guifg=#e0af68
  highlight IndentBlanklineIndent4 guifg=#9ece6a
  highlight IndentBlanklineIndent5 guifg=#2ac3de
  highlight IndentBlanklineIndent6 guifg=#7aa2f7
  highlight IndentBlanklineIndent7 guifg=#bb9af7
  omap     <silent> g :<C-U>lua require('tsht').nodes()<CR>
  xnoremap <silent> g :lua require('tsht').nodes()<CR>

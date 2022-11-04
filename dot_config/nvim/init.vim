set noswapfile
set nobackup
set autoread

set autoindent
set nocindent
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

set hlsearch
set incsearch
set ignorecase
set smartcase

set cursorline
set linebreak
set list
set listchars=tab:⇒\
set showbreak=+++
set wrap
set number
set matchpairs+=<:>
set showmatch

set nrformats+=alpha,octal

set clipboard=unnamedplus
set termguicolors
set shell=zsh
set mouse=
map <F1> <Esc>
imap <F1> <Esc>
lua require 'plugins'
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

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
autocmd BufNewFile,BufRead,BufReadPost *.rkt set filetype=racket
autocmd BufNewFile,BufRead,BufReadPost *.prolog set filetype=prolog
map <F1> <Esc>
imap <F1> <Esc>
lua require 'bootstrap'

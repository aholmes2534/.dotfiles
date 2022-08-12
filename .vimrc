" .vimrc 13082022

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Plugins
call plug#begin()

Plug 'voldikss/vim-floaterm'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

let g:floaterm_keymap_toggle = '<F12>'

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Pick a leader key
let mapleader = " "

" Security
set modelines=0
set undofile
" Show line numbers
set number

" Show file stats
set ruler

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching with highlight
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
" noh - no highlight
map <esc> :noh <CR>

" Color scheme (terminal)
colorscheme dracula

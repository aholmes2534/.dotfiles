"  ~/.vimrc 241021
"
"  to pause Vim and drop to terminal ^C + Z, then fg to return to Vim

syntax enable

" Set FZF Default to Ripgrep (must install ripgrep)
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --no-ignore-vcs'

set nocompatible
set ruler
set shortmess=I
set background=dark
set laststatus=2
set noerrorbells
set smartindent
set number
set nowrap
set nobackup
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set nohlsearch
set relativenumber
set cursorline
set scrolloff=8
set colorcolumn=84
set ignorecase
set splitbelow splitright
set equalalways
set mouse=a
set wildmenu
set path+=**
set wildignore+=**/node_modules/**

highlight ColorColumn ctermbg=5

" Set mapleader to space
let mapleader = " "
" Maps
nmap <leader>t :NERDTree<cr>
"nnoremap <leader>u :UndotreeToggle<cr>
" Files(runs $FZF_DEFAULT_COMMAND if defined)
nmap <leader>f :Files<cr> 

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/autoload/plugged')

" Declare the list of plugins

Plug 'christoomey/vim-tmux-navigator'

Plug 'sheerun/vim-polyglot' " Better Syntax Support

"Plug 'jiangmiao/auto-pairs' " Auto pairs for '(' '[' '{'

Plug 'scrooloose/nerdtree' " Directory Tree

Plug 'junegunn/fzf'  " Fzf is a command line fuzzy finder
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'  "A light statusline

Plug 'arcticicestudio/nord-vim' " Nord colorscheme

Plug 'ambv/black' " Python code formatter

Plug 'tpope/vim-commentary' " Easy commenter

Plug 'morhetz/gruvbox' " Gruvbox colorscheme

Plug 'makerj/vim-pdf' " Convert pdf to text

Plug 'dracula/vim' " Dracula colorscheme

Plug 'stevearc/vim-arduino' " Arduino and vim


" List ends here. Plugins become visible to Vim after this call
call plug#end()

" Uncomment required colorscheme here...
"colorscheme nord
autocmd vimenter * ++nested colorscheme gruvbox
"colorscheme dracula

"let g:floaterm_keymap_toggle = '<F12>' " Use F12 to toggle floating terminal

let g:arduino_use_cli = 1 " this will always use arduino-cli

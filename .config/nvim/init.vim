"----> nvim init.vim 10072022
"

colorscheme ron
syntax on
set mouse=a
set cursorline
set number
set relativenumber
set scrolloff=7

" use y and p with the system clipboard
set clipboard=unnamedplus

" set undo diretory and file
set udir=$HOME/.local/share/nvim/undo udf

" source plugins from vim-plug
source $HOME/.config/nvim/vim-plug/plugins.vim

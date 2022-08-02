" init.vim 03072022
"
set nu
set rnu
set splitbelow
set splitright
set ignorecase
set cursorline
set breakindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set undofile
set mouse=a
set scrolloff=4
set clipboard=unnamedplus
set nobackup

filetype plugin on

call plug#begin()
Plug 'nvim-lualine/lualine.nvim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'joshdick/onedark.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()

syntax on
colorscheme onedark

lua << END
require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = '|',
    section_separators = '',
  },
})
END

let mapleader = " "
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

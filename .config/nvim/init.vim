" init.vim 03072022

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
set mouse=nv
set scrolloff=4
set clipboard=unnamedplus
set nobackup

call plug#begin()
Plug 'neoclide/coc.nvim' , {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lualine/lualine.nvim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'joshdick/onedark.vim'
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

syntax on
colorscheme onedark

lua << END
require'lspconfig'.pyright.setup{}
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

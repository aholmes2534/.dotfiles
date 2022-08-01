-- ================================================================== --
-- ===                      EDITOR SETTINGS                       === --
-- ================================================================== --

local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt
local key = vim.keymap

-- # Set global options
opt.number = true
opt.relativenumber = true
opt.ignorecase = true
opt.cursorline = true
opt.smartcase = true
opt.hlsearch = false
opt.wrap = true
opt.breakindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = false
opt.undofile = true
opt.mouse = "nv"
opt.scrolloff = 4
opt.splitbelow = true
opt.splitright = true
opt.clipboard = "unnamedplus"

g.netrw_banner = 0
g.netrw_winsize = 30
g.loaded_perl_provider = 0

g.mapleader = ' '

key.set({'n', 'x'}, 'cp', '"+y')
key.set({'n', 'x'}, 'cv', '"+p')
key.set({'n', 'x'}, 'x', '"_x')
key.set('n', '<leader>w', '<cmd>write<cr>')
key.set('n', '<leader>a', ':keepjumps normal! ggVG<CR>')

local group = vim.api.nvim_create_augroup('user_cmds', {clear = true})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  group = group,
  callback = function()
    vim.highlight.on_yank({higroup = 'Visual', timeout = 200})
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'help', 'man'},
  group = group,
  command = 'nnoremap <buffer> q <cmd>quit<cr>'
})

-- ================================================================== --
-- ===                          PLUGINS                           === --
-- ================================================================== --

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if fn.empty(fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
  print('Done.')

  cmd('packadd packer.nvim')
  install_plugins = true
end

vim.api.nvim_create_user_command(
  'ReloadConfig',
  'source $MYVIMRC | PackerCompile',
  {}
)

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'joshdick/onedark.vim'
  use 'nvim-lualine/lualine.nvim'
	use 'ellisonleao/gruvbox.nvim'
	use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
}

  if install_plugins then
    require('packer').sync()
  end
end)

if install_plugins then
  return
end


-- ================================================================== --
-- ===                    PLUGIN CONFIGURATION                    === --
-- ================================================================== --

---
-- Colorschemes
---

--- Onedark
--opt.termguicolors = true
--cmd('colorscheme onedark')

--- Gruvbox
-- setup must be called before loading the colorscheme
-- Default options:

require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = false,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  overrides = {},
})
vim.o.background = "dark" -- light or dark mode
cmd("colorscheme gruvbox")

---
-- lualine.nvim (statusline)
---

opt.showmode = false
require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = '|',
    section_separators = '',
  },
})

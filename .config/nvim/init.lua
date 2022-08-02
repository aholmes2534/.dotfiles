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
opt.breakindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
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
  use 'jiangmiao/auto-pairs'
  use 'preservim/nerdtree'
  use 'preservim/nerdcommenter'
  use 'norcalli/nvim-colorizer.lua'
  use 'joshdick/onedark.vim'
  use 'nvim-lualine/lualine.nvim'

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

--- Onedark
opt.termguicolors = true
cmd('colorscheme onedark')

-- lualine.nvim (statusline)
opt.showmode = false
require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = '|',
    section_separators = '',
  },
})

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Simple plugins can be specified as strings
  use 'neoclide/coc.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'gruvbox-community/gruvbox'
  use 'neovim/nvim-lspconfig'
  use 'nvim-treesitter/nvim-treesitter'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'nvim-lua/plenary.nvim'

end)

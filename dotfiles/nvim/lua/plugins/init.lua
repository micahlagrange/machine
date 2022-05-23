local use = require('packer').use
local vimscript = vim.cmd
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- do I? who knows
vimscript [[packadd packer.nvim]]

require("telescope").setup {
  defaults = { },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
    },
  }
}


-- we may someday find out this return is not needed. not today
return require('packer').startup(function()
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  -- _-=X( LSP )X=-_ --
  use { 'neovim/nvim-lspconfig' }
  -- Auto completion
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }
  -- Simple plugins can be specified as strings
  use { 'nvim-telescope/telescope.nvim' }
  -- Syntax highlighting
  use { 'nvim-treesitter/nvim-treesitter' }
  -- Utils
  use { 'mbbill/undotree' }
  use { 'tpope/vim-fugitive' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'ThePrimeagen/harpoon' }
  -- theme
  use { "ellisonleao/gruvbox.nvim" }

end)


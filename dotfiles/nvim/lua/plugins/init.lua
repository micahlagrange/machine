local use = require("packer").use
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

local vimscript = vim.cmd
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- do I? who knows
vimscript([[packadd packer.nvim]])

require("telescope").setup({
	defaults = {},
	pickers = {
		find_files = {
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
		},
	},
})

return require("packer").startup(function()
	-- Packer can manage itself
	use({ "wbthomason/packer.nvim" })

	-- _-=X( LSP )X=-_ --
	use({ "neovim/nvim-lspconfig" })
	-- formatting
	use({ "jose-elias-alvarez/null-ls.nvim" })

	-- Auto completion
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "saadparwaiz1/cmp_luasnip" })
	-- Simple plugins can be specified as strings
	use({ "nvim-telescope/telescope.nvim" })
	-- Syntax highlighting
	use({ "nvim-treesitter/nvim-treesitter" })
	-- Utils
	use({ "mbbill/undotree" })
	use({ "tpope/vim-fugitive" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "ThePrimeagen/harpoon" })
	use({ "ThePrimeagen/git-worktree.nvim" })
	-- theme
	use({ "ellisonleao/gruvbox.nvim" })

	-- copilot
	use({ "github/copilot.vim" })

	--boostrapping
	if packer_bootstrap then
		require("packer").sync()
	end
end)

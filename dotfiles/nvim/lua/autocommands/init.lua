local api = vim.api

api.nvim_exec(
	[[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]],
	false
)

-- from the primeagen
api.nvim_exec(
	[[
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
]],
	false
)

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({

		filter = function(clients)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return vim.tbl_filter(function(client)
				return client.name == "null-ls"
			end, clients)
			-- return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup({
	--formatting
	sources = {
		--require("null-ls").builtins.diagnostics.eslint,
		--require("null-ls").builtins.completion.spell,
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.prettierd,
	},
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = on_attach,
})

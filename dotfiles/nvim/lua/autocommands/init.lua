local api = vim.api

api.nvim_exec([[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]], false)

api.nvim_exec([[
augroup ts_pretty
  autocmd!
  autocmd BufWritePre,InsertLeave *.ts CocCommand prettier.formatFile
  autocmd BufWritePre,InsertLeave *.js CocCommand prettier.formatFile
augroup end
]], false)

-- from the primeagen
api.nvim_exec([[
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
]], false)


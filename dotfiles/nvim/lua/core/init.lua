local o = vim.o
local opt = vim.opt
local wo = vim.wo
local api = vim.api

-- Options
o.exrc = true
--o.guicursor = nil
o.relativenumber = true
o.nu = true

o.hlsearch = false
o.hidden = true
o.errorbells = false

o.tabstop = 4 
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

o.wrap = false

o.swapfile = false
o.backup = false
o.undodir = '/Users/micah/.vim/undodir'
o.undofile = true

o.incsearch = true
o.termguicolors = true
o.scrolloff = 8
o.showmode = false
o.completeopt = 'menuone,noinsert,noselect'
wo.colorcolumn = '80'
wo.signcolumn = 'yes'
o.mouse = 'a'

-- Give more space for displaying messages.
o.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
o.updatetime = 50

-- Don't pass messages to |ins-completion-menu|
opt.shortmess:append("c")

api.nvim_command [[colorscheme gruvbox]]
api.nvim_exec([[
    highlight Normal guibg=none
]], false)


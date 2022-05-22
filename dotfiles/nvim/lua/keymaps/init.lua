-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- -- Leader
vim.g.mapleader = ' '

-- let loaded_matchparen = 1
map('n', '<leader>gl', '<cmd>Git log --oneline<cr>')

-- Find files using Telescope command-line sugar.
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
--find_command=fd,--hidden<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- file tree!
map('n', '<leader>pv', ':wincmd v<bar> :Ex <bar> :vertical resize 30<CR>')


-- map ctrl+space to auto complete
-- api.nvim_exec([[ 
-- inoremap <silent><expr> <c-space> coc#refresh()
-- ]], false)

--harpoon!
map('n', '<leader>hh', '<cmd>lua require("harpoon.mark").add_file()<cr>')
map('n', '<leader>oo', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>')
map('n', '<leader>oa', '<cmd>lua require("harpoon.ui").nav_file(1)<cr>')
map('n', '<leader>os', '<cmd>lua require("harpoon.ui").nav_file(2)<cr>')
map('n', '<leader>od', '<cmd>lua require("harpoon.ui").nav_file(3)<cr>')
map('n', '<leader>of', '<cmd>lua require("harpoon.ui").nav_file(4)<cr>')



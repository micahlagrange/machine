-- Functional wrapper for mapping custom keybindings
function nnoremap(lhs, rhs, opts)
	local options = { noremap = true, silent = false }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap("n", lhs, rhs, options)
end

function xnoremap(lhs, rhs, opts)
	local options = { noremap = true, silent = false }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap("x", lhs, rhs, options)
end

-- -- Leader
vim.g.mapleader = " "

-- let loaded_matchparen = 1
nnoremap("<leader>gl", "<cmd>Git log --oneline<cr>")

-- Find files using Telescope command-line sugar.
nnoremap("<C-p>", "<cmd>Telescope find_files<cr>")
--find_command=fd,--hidden<cr>')
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")

-- file tree!
nnoremap("<leader>pv", ":wincmd v<bar> :Ex <bar> :vertical resize 30<CR>")

--harpoon!
nnoremap("<leader>mm", '<cmd>lua require("harpoon.mark").add_file()<cr>')
nnoremap("<C-o>", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>')
nnoremap("<C-h>", '<cmd>lua require("harpoon.ui").nav_file(1)<cr>')
nnoremap("<C-j>", '<cmd>lua require("harpoon.ui").nav_file(2)<cr>')
nnoremap("<C-k>", '<cmd>lua require("harpoon.ui").nav_file(3)<cr>')
nnoremap("<C-l>", '<cmd>lua require("harpoon.ui").nav_file(4)<cr>')

-- i become vscode
nnoremap("<A-Up>", ":<C-u>silent! move-2<CR>==")
nnoremap("<A-Down>", ":<C-u>silent! move+<CR>==")
xnoremap("<A-Up>", ":<C-u>silent! '<,'>move-2<CR>gv=gv")
xnoremap("<A-Down>", ":<C-u>silent! '<,'>move'>+<CR>gv=gv")

-- harpoon and primeagen stuffs
require("git-worktree").setup({
	change_directory_command = "cd", -- default: "cd",
	update_on_change = true, -- default: true,
	update_on_change_command = "e .", -- default: "e .",
	clearjumps_on_change = true, -- default: true,
	autopush = true, -- default: false,
})

require("telescope").load_extension("git_worktree")

-- Creates a worktree.  Requires the path, branch name, and the upstream
-- Example:
--:lua require("git-worktree").create_worktree("feat-69", "master", "origin")

-- switches to an existing worktree.  Requires the path name
-- Example:
--:lua require("git-worktree").switch_worktree("feat-69")

-- deletes to an existing worktree.  Requires the path name
-- Example:
--:lua require("git-worktree").delete_worktree("feat-69")

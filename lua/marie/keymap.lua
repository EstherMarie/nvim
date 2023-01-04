-- from:
-- https://github.com/ThePrimeagen/init.lua/
-- https://github.com/LunarVim/nvim-basic-ide/

vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- move down and keep cursor in center
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- move up and keep cursor in center

vim.keymap.set("x", "<leader>p", [["_dP]]) -- keep the copied word in clipboard

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) --copy only to vim clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- copy to clipboard

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Plugins --

-- Packer
vim.keymap.set("n", "<leader>s", ":PackerSync<CR>", opts)

-- Fugitive
vim.keymap.set("n", "<leader>g", ":Git<CR>", opts)
vim.keymap.set("n", "<leader>ga", ":Git add<CR>", opts)
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", opts)
vim.keymap.set("n", "<leader>gl", ":Git log<CR>", opts)
vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", opts)
vim.keymap.set("n", "<leader>gm", ":Git mergetool<CR>", opts)

-- NvimTree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
vim.keymap.set("n", "<leader>f", ":Telescope<CR>", opts)
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", opts)
vim.keymap.set("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>", opts)
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Comment
vim.keymap.set("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
vim.keymap.set("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- from:
-- https://github.com/ThePrimeagen/init.lua/
-- https://github.com/LunarVim/nvim-basic-ide/

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- move down and keep cursor in center
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- move up and keep cursor in center

vim.keymap.set("x", "<leader>p", [["_dP]]) -- keep the copied word in clipboard

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {desc = "Copy only to Vim clipboard"}) --copy only to vim clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]], {desc = "Copy to clipboard"}) -- copy to clipboard

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- remap Esc to jk
vim.keymap.set("i", "jk", "<esc>", opts)

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
vim.keymap.set("n", "<leader>f", ":Telescope<CR>", {})
vim.keymap.set('n', '<leader>ff', ":Telescope builtin.find_files<CR>", {})
vim.keymap.set('n', '<leader>fg', ":Telescope builtin.live_grep<CR>", {})
vim.keymap.set('n', '<leader>fb', ":Telescope builtin.buffers<CR>", {})
vim.keymap.set('n', '<leader>fh', ":Telescope builtin.help_tags<CR>", {})

-- Comment
vim.keymap.set("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", {desc = "Toggle Comment"})
vim.keymap.set("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', {desc = "Toggle Comment"})

-- Trouble
vim.keymap.set("n", "<leader>x", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)

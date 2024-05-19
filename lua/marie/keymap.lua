-- from:
-- https://github.com/ThePrimeagen/init.lua/
-- https://github.com/LunarVim/nvim-basic-ide/


-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }



vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "<C-d>", "<C-d>zz") -- move down and keep cursor in center
keymap("n", "<C-u>", "<C-u>zz") -- move up and keep cursor in center

-- keymap("x", "<leader>p", [["_dP]]) -- keep the copied word in clipboard

-- keymap({"n", "v"}, "<leader>y", [["+y]], {desc = "Copy only to Vim clipboard"}) --copy only to vim clipboard
-- keymap("n", "<leader>Y", [["+Y]], {desc = "Copy to clipboard"}) -- copy to clipboard

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", ":bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- remap Esc to jk
keymap("i", "jk", "<esc>", opts)
keymap("n", "mm", ":w!<CR>", opts)
keymap("n", "<CR>", "i<CR><esc>", opts)

keymap("n", "<leader>f", vim.lsp.buf.format, { desc = 'Formats a buffer with LSP' })

-- Plugins --

-- Packer
-- keymap("n", "<leader>s", ":PackerSync<CR>", opts)

-- NvimTree
keymap("n", "<leader>w", ":NvimTreeToggle<CR>", { desc = 'Toggle Tree' })

-- Telescope
keymap("n", "<leader>s", ":Telescope<CR>", {})
keymap('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
keymap('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
keymap('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
keymap('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })

-- DAP
keymap('n', '<leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = 'DAP: Toggle Breakpoint' })
keymap('n', '<leader>dc', "<cmd>lua require'dap'.continue()<CR>", { desc = 'DAP: Continue' })
keymap('n', '<leader>do', "<cmd>lua require'dap'.step_over()<CR>", { desc = 'DAP: Step Over' })
keymap('n', '<leader>di', "<cmd>lua require'dap'.step_into()<CR>", { desc = 'DAP: Step Into' })
keymap('n', '<leader>dr', "<cmd>lua require'dap'.repl.open()<CR>", { desc = 'DAP: REPL Open' })
keymap('n', '<leader>du', "<cmd>lua require('dapui').toggle()<CR>", { desc = 'Toggle dap-ui' })

-- Comment
keymap("n", "<leader>;", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { desc = "Toggle Comment" })
keymap("x", "<leader>;", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
  { desc = "Toggle Comment" })

-- Trouble
keymap("n", "<leader>x", "<cmd>TroubleToggle<cr>",
  { silent = true, noremap = true }
)
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  { silent = true, noremap = true }
)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { silent = true, noremap = true }
)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  { silent = true, noremap = true }
)
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  { silent = true, noremap = true }
)
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  { silent = true, noremap = true }
)
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  { silent = true, noremap = true }
)

-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = "Diagnostic - go to previous" })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = "Diagnostic - go to next" })
keymap('n', '<leader>e', vim.diagnostic.open_float, { desc = "Diagnostic - open float" })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Diagnostic - set loc list" })

-- Fugitive

keymap('n', '<leader>gg', '<cmd>Git<cr>', { desc = 'Git: Fugitive' })
keymap('n', '<leader>ga', '<cmd>Git add %<cr>', { desc = 'Git add current file' })
keymap('n', '<leader>gc', '<cmd>Git commit<cr>', { desc = 'Git commit' })
keymap('n', '<leader>gca', '<cmd>Git commit --amend<cr>', { desc = 'Git commit amend' })
keymap('n', '<leader>gs', '<cmd>Git status<cr>', { desc = 'Git status' })
keymap('n', '<leader>gl', '<cmd>Git log --oneline<cr>', { desc = 'Git log' })
keymap('n', '<leader>gh', '<cmd>Git log --oneline --graph --decorate --all<cr>', { desc = 'Git hist' })
keymap('n', '<leader>gp', '<cmd>Git push<cr>', { desc = 'Git push' })
keymap('n', '<leader>gpf', '<cmd>Git push --force-with-lease<cr>', { desc = 'Git push force-with-lease' })


-- Eslint_d automatic fixing
-- keymap('n', "<leader>f", "<cmd>%!eslint_d --stdin --fix-to-stdout<cr>`F", {desc = "ESLint: Format all file" })
-- keymap('v', "<leader>f", "<cmd>!eslint_d --stdin --fix-to-stdout<cr>gv", { desc = "ESLint: Format selection" })
--
-- keymap('n', "<leader>f", "<cmd>EslintFixAll<cr>", {desc = "ESLint: Format all file" })

-- rest.nvim
-- keymap('n', '<leader>r', 'RestNvim', { desc = 'RestNvim' })
-- keymap('n', '<leader>rr', '<Plug>RestNvim', { desc = 'RestNvim - Run the request under the cursor' })
-- keymap('n', '<leader>rp', '<Plug>RestNvimPreview', { desc = 'RestNvim - Preview the request cURL command' })
-- keymap('n', '<leader>rl', '<Plug>RestNvimLast', { desc = 'RestNvim - re-run the last request' })

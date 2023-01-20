local ok, catppuccin = pcall(require, "catppuccin")
if not ok then return end

vim.g.catppuccin_flavour = "frappe"
catppuccin.setup()
vim.cmd [[colorscheme catppuccin]]


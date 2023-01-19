-- local colorscheme = "catppuccin-macchiato" -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

-- local colorscheme = "nord"
-- local colorscheme = "tokyonight"

local ok, catppuccin = pcall(require, "catppuccin")
if not ok then return end

vim.g.catppuccin_flavour = "frappe"
catppuccin.setup()
vim.cmd [[colorscheme catppuccin]]
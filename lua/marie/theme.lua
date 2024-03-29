local ok, catppuccin = pcall(require, "catppuccin")
if not ok then return end

vim.g.catppuccin_flavour = "frappe"
catppuccin.setup({
  transparent_background = true,
  integrations = {
    illuminate = true,
    telescope = true,
    ts_rainbow2 = true
  }
})

vim.cmd [[colorscheme catppuccin]]

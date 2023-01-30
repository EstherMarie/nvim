-- Set lualine as statusline
-- See `:help lualine.txt`
require('onedark')

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'catppuccin',
    component_separators = '|',
    section_separators = '',
  },
}


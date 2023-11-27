-- Enable Comment.nvim
require('Comment').setup({
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})

require 'nvim-treesitter.configs'.setup {
  ts_context_commentstring = {
    enable = true,
    config = {
      javascript = {
        __default = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s'
      },
      typescript = {
        __default = '// %s',
        __multiline = '/* %s */',
        tsx_element = '{/* %s */}',
        tsx_fragment = '{/* %s */}',
        tsx_attribute = '// %s',
      }
    }
  }
}

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  -- char = '┊',
  show_current_context = true,
  show_trailing_blankline_indent = false,
}

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  current_line_blame = true,
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

require("nvim-tree").setup({
  -- on_attach = on_attach,
  renderer = {
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = true,
      },
    }
  }
})


require('illuminate').configure({})
require('bufferline').setup({})

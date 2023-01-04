-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'
  use 'folke/neodev.nvim'
  use{'nvim-treesitter/nvim-treesitter', run = ':TSUpdateSync'}
  use 'jose-elias-alvarez/null-ls.nvim'


  -- ========== File explorer, navigation ==========
  
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    require("nvim-tree").setup({
      view = {
        mappings = {
          list = {
            { key = "l", action = "open_file" },
          },
        },
      },
    })
  }
  use {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {}
    end,
    event = "BufWinEnter",
  }


  -- Git
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup{
        current_line_blame = true,
      }
    end,
    event = "BufRead",
  }
 

  -- ========== Terminal and Statusline ==========

  use {
    'akinsho/toggleterm.nvim', 
    tag = '*', 
    config = function()
      require('toggleterm').setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
        },
      })
    end,
    event = "BufWinEnter",
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    require('lualine').setup{
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = {'|'},
        section_separators = {''},
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  }


  -- ========== Editing ==========
  
  use {
    'styled-components/vim-styled-components', 
    branch = 'main' 
  }
  use 'editorconfig/editorconfig-vim'
  use {
    "windwp/nvim-autopairs",
     config = function() 
       require("nvim-autopairs").setup {} 
     end
  }
  use {
    'numToStr/Comment.nvim',
    require('Comment').setup(),
    event = "BufRead",
  }
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }


  -- ========== Themes ==========
  use 'folke/tokyonight.nvim'
  use 'arcticicestudio/nord-vim'

  -- LSP
  
  -- use {
  --   'neoclide/coc.nvim', 
  --   branch= 'release'
  -- }
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    },
    config = function()
      local lsp = require('lsp-zero')
      lsp.preset('recommended')

      lsp.setup()
    end
  }
end)

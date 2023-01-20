
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'
  use 'folke/neodev.nvim'
  use 'j-hui/fidget.nvim'

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

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Toggleterm
  use {"akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("toggleterm").setup()
    end}

  -- cool plugins
  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use 'nvim-tree/nvim-web-devicons'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {}
    end,
    event = "BufWinEnter",
  }
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({ sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.gitsigns,
      } })
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }


  -- ========== Editing and formatting ==========

  use {
    'styled-components/vim-styled-components',
    branch = 'main'
  }
  use {
    "windwp/nvim-autopairs",
     config = function()
       require("nvim-autopairs").setup {}
     end
  }
  use 'mattn/emmet-vim'
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function ()
      require('todo-comments').setup {}
    end
  }

  -- ===== Themes =====
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'folke/tokyonight.nvim'
  use 'arcticicestudio/nord-vim'
  use 'navarasu/onedark.nvim'


end)

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

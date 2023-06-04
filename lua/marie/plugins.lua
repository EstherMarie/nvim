vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)

  -- ========== Core ==========

  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'
  use 'folke/neodev.nvim'
  use 'j-hui/fidget.nvim'


  -- ========== LSP ==========

  use {
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }
  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

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

  -- ========== Treesitter ==========

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

  -- ----- Plugins -----

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end
  }
  use {
    'HiPhish/nvim-ts-rainbow2',
    branch = 'master'
  }


  -- ========== Interface ==========

  -- Toggleterm, statusline, bufferline etc
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
  use { 
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("toggleterm").setup()
    end 
  }
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
  
  -- ========== Fuzzy Finder ==========

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
  
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  
  
  -- ========== Editing and formatting ==========
  
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'RRethy/vim-illuminate'
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
  use 'mattn/emmet-vim'
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
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup {}
    end
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require("lspsaga").setup({
          lightbulb = {
          enable = false,
          enable_in_insert = false,
          sign = false,
          virtual_text = false,
        },
      })
    end,
    requires = { {"nvim-tree/nvim-web-devicons"} }
  })

  -- ========== Themes ==========

  use { "catppuccin/nvim", as = "catppuccin" }
  use 'arcticicestudio/nord-vim'
  use 'folke/tokyonight.nvim'
  use 'navarasu/onedark.nvim'

  -- ========== Utilities ==========

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- rest-nvim
  use {
    "rest-nvim/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }

  use 'ThePrimeagen/vim-be-good'

end)

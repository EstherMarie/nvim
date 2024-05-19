local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- ========== Core ==========

  'nvim-lua/plenary.nvim',
  'folke/neodev.nvim',
  -- {'j-hui/fidget.nvim', tag = 'legacy' },

  -- ========== LSP ==========

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 
        'j-hui/fidget.nvim',
        opts = {} 
      },

      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      { 
        'folke/neodev.nvim',
        opts = {} 
      },
    },
  },
  -- Additional lua configuration, makes nvim stuff amazing
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  "lukas-reineke/lsp-format.nvim",

  -- ========== Debug Adapter ==========

  'mfussenegger/nvim-dap',
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap"},
  },
  -- {
  --   "microsoft/vscode-js-debug",
  --   opt = true,
  --   run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
  -- },

  -- ========== Treesitter ==========

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  -- ----- Plugins -----

  { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = 'nvim-treesitter',
  },
  'JoosepAlviste/nvim-ts-context-commentstring',
  {
    'windwp/nvim-ts-autotag',
    opts = {}
  },
  {
    'HiPhish/nvim-ts-rainbow2',
    branch = 'master'
  },


  -- ========== Interface ==========

  -- Toggleterm, statusline, bufferline etc
  'nvim-tree/nvim-web-devicons',
  'ChristianChiarulli/neovim-codicons',
  'nvim-lualine/lualine.nvim',
  { 'akinsho/bufferline.nvim', version = "v3.*", dependencies = 'nvim-tree/nvim-web-devicons' },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },

  -- ========== Fuzzy Finder ==========

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  ,

  -- ========== Linting and formatting ==========
  'mfussenegger/nvim-lint',
  'stevearc/conform.nvim',

  -- ========== Editor ==========

  {'lukas-reineke/indent-blankline.nvim', version = "v2.*" },
  'numToStr/Comment.nvim',
  'RRethy/vim-illuminate',
  'tpope/vim-sleuth',
  'godlygeek/tabular',
  {
    'styled-components/vim-styled-components',
    branch = 'main'
  },
  {
    "windwp/nvim-autopairs",
    opts = {}
  },
  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {}
  },
  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    opts = {}
  },
  'jbyuki/instant.nvim',
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  {
    'mattn/emmet-vim',
    config = function()
      vim.g.user_emmet_settings = {
        ["html"] = {
          ["quote_char"] = "'"
        },
        ["javascript.jsx"] = {
          ["extends"] = "jsx",
          ["quote_char"] = "'"
        },
        ["typescript.tsx"] = {
          ["extends"] = "tsx",
          ["quote_char"] = "'"
        }
      }
    end,
  },

  -- ========== Themes ==========

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
  },
  'arcticicestudio/nord-vim',
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- transparent = true,
      -- styles = {
      --   sidebars = "transparent",
      --   floats = "transparent",
      -- },
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = ...
  },

  -- ========== Utilities ==========

  -- Git related plugins
  'tpope/vim-fugitive',
  'lewis6991/gitsigns.nvim',
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },

  'ThePrimeagen/vim-be-good',

}, {})


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  -- ========== Core ==========

  'wbthomason/packer.nvim',

  'nvim-lua/plenary.nvim',
  'folke/neodev.nvim',
  {
    'j-hui/fidget.nvim',
    tag = 'legacy'
  },


  -- ========== LSP ==========

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  },
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'rafamadriz/friendly-snippets' },
  },
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',

  -- ========== Treesitter ==========

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    depencencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },


  -- ----- Plugins -----

  { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  },
  'JoosepAlviste/nvim-ts-context-commentstring',
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end
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
    'folke/which-key.nvim',
    opts = {},
  },

  -- ========== Fuzzy Finder ==========

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function ()
      return vim.fn.executable 'make' == 1
    end,
  },


  -- ========== Editing and formatting ==========

  { 'lukas-reineke/indent-blankline.nvim', version = "v2.*" },
  'numToStr/Comment.nvim',
  'RRethy/vim-illuminate',
  'tpope/vim-sleuth',
  'mattn/emmet-vim',
  {
    'styled-components/vim-styled-components',
    branch = 'main'
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  },
  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {}
  },
  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    opts = {},
  },

  -- ========== Themes ==========

  {
    "catppuccin/nvim", 
    name = "catppuccin",
    priority = 1000
  },
  'arcticicestudio/nord-vim',
  'folke/tokyonight.nvim',

  -- ========== Utilities ==========

  -- Git related plugins
  'tpope/vim-fugitive',
  'lewis6991/gitsigns.nvim',
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },

  'ThePrimeagen/vim-be-good',

}, {})

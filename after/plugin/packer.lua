return require("packer").startup(function(use)
  -- Packer manages itself
  use "wbthomason/packer.nvim"

  use "nvim-lua/plenary.nvim"

  use "nvim-lua/popup.nvim"
  use "kyazdani42/nvim-web-devicons"

  -- Pairing
  use "windwp/nvim-autopairs"

  -- Indentation markers
  use "lukas-reineke/indent-blankline.nvim"

  -- Git wrapper
  use "tpope/vim-fugitive"
  -- Git changes on sign column
  use "lewis6991/gitsigns.nvim"

  -- Treesitter language parser
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  -- Shows the context of the currently visible buffer contents
  use 'nvim-treesitter/nvim-treesitter-context'

  use "ThePrimeagen/harpoon"

  -- Syntax highlight and filetype detection for RON
  use 'ron-rs/ron.vim'

  -- Undo history tree
  use 'mbbill/undotree'

  -- Fuzzy finder
  use { "nvim-telescope/telescope.nvim", tag = '0.1.x' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- File tree
  use "kyazdani42/nvim-tree.lua"

  -- Status line
  use "nvim-lualine/lualine.nvim"

  -- Omni theme
  use "getomni/neovim"

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'jose-elias-alvarez/null-ls.nvim' }, -- For ESLint
      { 'simrat39/rust-tools.nvim' }, -- For Rust

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  }
end)

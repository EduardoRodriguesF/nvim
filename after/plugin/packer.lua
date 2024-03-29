return require('packer').startup(function(use)
  -- Packer manages itself
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'

  use 'nvim-lua/popup.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- Git wrapper
  use 'tpope/vim-fugitive'
  -- Git changes on sign column
  use 'lewis6991/gitsigns.nvim'

  use 'github/copilot.vim'

  -- Treesitter language parser
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- Shows the context of the currently visible buffer contents
  use 'nvim-treesitter/nvim-treesitter-context'

  use {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  -- Undo history tree
  use 'mbbill/undotree'

  -- Debugger
  use 'mfussenegger/nvim-dap'

  -- Fuzzy finder
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.x' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use { 'folke/twilight.nvim' }

  -- Status line
  use 'nvim-lualine/lualine.nvim'

  -- Omni theme
  use { 'getomni/neovim', as = 'omni' }

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
      { 'simrat39/symbols-outline.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    },
  }
end)
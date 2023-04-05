local packer = require('packer')

return packer.startup(function(use)
  -- Packer manages itself
  use "wbthomason/packer.nvim"

  use "nvim-lua/plenary.nvim"

  -- Debugger
  use 'mfussenegger/nvim-dap'

  use "nvim-lua/popup.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "L3MON4D3/LuaSnip"

  use "gpanders/editorconfig.nvim"

  -- Pairing
  use "windwp/nvim-autopairs"
  use "tpope/vim-surround"

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

  -- LSP tooling manager
  use 'williamboman/mason.nvim'

  -- Inject diagnostics
  use "jose-elias-alvarez/null-ls.nvim"

  -- Syntax highlight and filetype detection for RON
  use 'ron-rs/ron.vim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason-lspconfig.nvim'

  -- Completions
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'

  -- Undo history tree
  use 'mbbill/undotree'

  -- Fuzzy finder
  use { "nvim-telescope/telescope.nvim", tag = '0.1.x' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- File tree
  use "kyazdani42/nvim-tree.lua"

  -- Status line
  use "nvim-lualine/lualine.nvim"

  -- Zen mode
  use "folke/zen-mode.nvim"

  -- Omni theme
  use "getomni/neovim"

  -- LSP enhanced
  use({
    "glepnir/lspsaga.nvim",
    opt = true,
    branch = "main",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        lightbulb = {
          enabled = false
        }
      })
    end,
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  })
end)

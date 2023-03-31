local packer = require('packer')

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use 'mfussenegger/nvim-dap'
  use "nvim-lua/popup.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "L3MON4D3/LuaSnip"

  use "gpanders/editorconfig.nvim"
  use "windwp/nvim-autopairs"
  use "lukas-reineke/indent-blankline.nvim"
  use "lewis6991/gitsigns.nvim"

  use "nvim-treesitter/nvim-treesitter"
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'williamboman/mason.nvim'
  use "jose-elias-alvarez/null-ls.nvim"
  use 'ron-rs/ron.vim'

  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason-lspconfig.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'

  use { "nvim-telescope/telescope.nvim", tag = '0.1.x' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use "kyazdani42/nvim-tree.lua"
  use "nvim-lualine/lualine.nvim"
  use "romgrk/barbar.nvim"
  use "folke/trouble.nvim"

  use "getomni/neovim"

  use({
    "glepnir/lspsaga.nvim",
    opt = true,
    branch = "main",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  })
end)

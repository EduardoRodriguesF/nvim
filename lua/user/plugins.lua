local packer = require('packer')

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "kyazdani42/nvim-web-devicons"

  use "gpanders/editorconfig.nvim"
  
  use "nvim-treesitter/nvim-treesitter"
  use 'williamboman/nvim-lsp-installer'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use { "nvim-telescope/telescope.nvim", tag = '0.1.x' }
  use "kyazdani42/nvim-tree.lua"
  use "nvim-lualine/lualine.nvim"

  use "getomni/neovim"
end)

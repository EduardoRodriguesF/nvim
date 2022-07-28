local packer = require('packer')

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "haorenW1025/completion-nvim"
  
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/completion-treesitter"

  use { "nvim-telescope/telescope.nvim", tag = '0.1.x' }
  use "kyazdani42/nvim-tree.lua"
  use "nvim-lualine/lualine.nvim"

  use "getomni/neovim"
end)

local packer = require('packer')

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  
  use { "nvim-telescope/telescope.nvim", tag = '0.1.x' }
  use "kyazdani42/nvim-tree.lua"
end)

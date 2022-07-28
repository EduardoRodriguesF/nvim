require "user.plugins"
require "user.options"
require "user.keymaps"

require("nvim-tree").setup()

require("lualine").setup({
  options = {
    theme = 'omni'
  }
})

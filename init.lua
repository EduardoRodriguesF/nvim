require "user.plugins"
require "user.options"
require "user.keymaps"

require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
})

require("nvim-tree").setup()

require("lualine").setup({
  options = {
    theme = 'omni'
  }
})

require "user.treesitter.migration" -- Hopefully temporary

require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "javascript" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
})

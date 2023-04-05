require "user.plugins"
require "user.options"
require "user.keymaps"

vim.diagnostic.config({
  virtual_text = false,
})

-- Hopefully temporary
require "user.treesitter.migration"


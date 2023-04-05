require "user.plugins"
require "user.options"
require "user.keymaps"

vim.diagnostic.config({
  virtual_text = false,
})

-- Hopefully temporary
require "user.treesitter.migration"

local omnisharp_bin = "/home/edurf/.local/share/nvim/lsp_servers/omnisharp/omnisharp/OmniSharp"
local root_pattern = require('lspconfig.util').root_pattern

require 'lspconfig'.omnisharp.setup {
  cmd = { "dotnet", omnisharp_bin },
  root_dir = function(path)
    return root_pattern('*.sln')(path) or root_pattern('*.csproj')(path)
  end
}


vim.diagnostic.config({
  virtual_text = false,
})

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  automatic_installation = true,
})

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,
  ["eslint"] = function ()
    local null_ls = require("null-ls")

    -- Dedicated plugin for ESLint and Prettier diagnostics
    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.prettier
      }
    })

    -- Default setup
    require("lspconfig").eslint.setup {}
  end,
  ["omnisharp"] = function ()
    -- Manually fetch binary for omnisharp server.
    local omnisharp_bin = "/home/edurf/.local/share/nvim/lsp_servers/omnisharp/omnisharp/OmniSharp"
    local root_pattern = require('lspconfig.util').root_pattern

    require 'lspconfig'.omnisharp.setup({
      cmd = { "dotnet", omnisharp_bin },
      root_dir = function(path)
        return root_pattern('*.sln')(path) or root_pattern('*.csproj')(path)
      end
    })
  end
}


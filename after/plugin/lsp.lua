local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

vim.diagnostic.config({
  virtual_text = false
})

-- don't initialize this language server
-- we will use rust-tools to setup rust_analyzer
lsp.skip_server_setup({ 'rust_analyzer' })

lsp.setup_servers({
  'eslint',
  'tsserver',
  opts = {
    single_file_support = false,
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr }
  lsp.default_keymaps(opts)

  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
  vim.keymap.set("n", "<C-Space>", vim.lsp.buf.code_action, opts)
end)

lsp.configure('eslint', {
  on_attach = function()
    local null_ls = require("null-ls")

    -- Dedicated plugin for ESLint and Prettier diagnostics
    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.prettier
      }
    })
  end
})

lsp.configure('omnisharp', {
  on_attach = function()
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
})



-- Fix undefined vim
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})

-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- Initialize rust_analyzer with rust-tools
local rust_lsp = lsp.build_options('rust_analyzer', {
  single_file_support = false,
})

require('rust-tools').setup({ server = rust_lsp })

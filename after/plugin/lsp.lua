local lsp = require("lsp-zero")
local cmp = require('cmp')

lsp.preset("recommended")

cmp.setup({
  mapping = {
    -- Trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
  }
})

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

  vim.keymap.set("n", "<C-Space>", vim.lsp.buf.code_action, opts)

  vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
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

-- Hide all semantic highlights
-- This fixes the weird highlight issues after updating to 0.9
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
	vim.api.nvim_set_hl(0, group, {})
end

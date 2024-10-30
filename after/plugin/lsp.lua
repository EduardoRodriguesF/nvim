local lsp = require 'lsp-zero'
local cmp = require 'cmp'
local symbols_outline = require 'symbols-outline'
local util = require 'lspconfig.util'

lsp.preset 'recommended'

cmp.setup {
  mapping = {
    -- Trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.recently_used,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}

symbols_outline.setup()

lsp.set_sign_icons {
  error = '',
  warn = '',
  hint = '󰌶',
  info = '',
}

vim.diagnostic.config {
  virtual_text = false,
}

-- don't initialize this language server
-- we will use rust-tools to setup rust_analyzer
lsp.skip_server_setup { 'rust_analyzer' }

lsp.setup_servers {
  'eslint',
  'ts_ls',
  'clangd',
  'gopls',
  opts = {
    single_file_support = false,
  },
}

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr }
  lsp.default_keymaps(opts)

  vim.keymap.set('n', '<leader>o', vim.cmd.SymbolsOutline, opts)

  vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)

  if util.root_pattern("deno.json", "import_map.json")(vim.fn.getcwd()) then
    if client.name == "ts_ls" then
      client.stop()
      return
    end
  end
end)

lsp.configure('eslint', {
  on_attach = function()
    local null_ls = require 'null-ls'

    -- Dedicated plugin for ESLint and Prettier diagnostics
    null_ls.setup {
      sources = {
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettier,
      },
    }
  end,
})

lsp.configure('denols', {
  root_dir = util.root_pattern("deno.json", "deno.jsonc")
})

lsp.configure('omnisharp', {
  on_attach = function()
    -- Manually fetch binary for omnisharp server.
    local omnisharp_bin =
    '/home/edurf/.local/share/nvim/lsp_servers/omnisharp/omnisharp/OmniSharp'

    require('lspconfig').omnisharp.setup {
      cmd = { 'dotnet', omnisharp_bin },
      root_dir = function(path)
        return util.root_pattern '*.sln' (path) or util.root_pattern '*.csproj' (path)
      end,
    }
  end,
})

lsp.configure('gopls', {
  on_attach = function()
    -- Automatically organize imports
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*.go',
      callback = function()
        vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
      end
    })

    require('lspconfig').gopls.setup()
  end,
})

lsp.configure('clangd', {
  on_attach = function()
    vim.keymap.set('n', '<leader>h', vim.cmd.ClangdSwitchSourceHeader, {})

    require('lspconfig').clangd.setup({
      cmd = { "clangd", "--background-index" },
    })
  end,
})

-- Fix undefined vim
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- Initialize rust_analyzer with rust-tools
local rust_lsp = lsp.build_options('rust_analyzer', {
  single_file_support = false,
})

require('rust-tools').setup { server = rust_lsp }

-- Hide all semantic highlights
-- This fixes the weird highlight issues after updating to 0.9
for _, group in ipairs(vim.fn.getcompletion('@lsp', 'highlight')) do
  vim.api.nvim_set_hl(0, group, {})
end
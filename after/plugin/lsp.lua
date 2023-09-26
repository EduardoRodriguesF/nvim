local lsp = require 'lsp-zero'
local cmp = require 'cmp'
local symbols_outline = require 'symbols-outline'

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
      require("clangd_extensions.cmp_scores"),
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
  'tsserver',
  'clangd',
  'gopls',
  opts = {
    single_file_support = false,
  },
}

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr }
  lsp.default_keymaps(opts)

  vim.keymap.set('n', '<leader>o', vim.cmd.SymbolsOutline, opts)

  vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)
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

lsp.configure('omnisharp', {
  on_attach = function()
    -- Manually fetch binary for omnisharp server.
    local omnisharp_bin =
      '/home/edurf/.local/share/nvim/lsp_servers/omnisharp/omnisharp/OmniSharp'
    local root_pattern = require('lspconfig.util').root_pattern

    require('lspconfig').omnisharp.setup {
      cmd = { 'dotnet', omnisharp_bin },
      root_dir = function(path)
        return root_pattern '*.sln'(path) or root_pattern '*.csproj'(path)
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
    require("clangd_extensions").setup({
      inlay_hints = {
        inline = vim.fn.has("nvim-0.10") == 1,
        -- Only show inlay hints for the current line
        only_current_line = true,
        -- Event which triggers a refresh of the inlay hints.
        -- You can make this { "CursorMoved" } or { "CursorMoved,CursorMovedI" } but
        -- not that this may cause  higher CPU usage.
        -- This option is only respected when only_current_line and
        -- autoSetHints both are true.
        only_current_line_autocmd = { "CursorHold" },
        -- whether to show parameter hints with the inlay hints or not
        show_parameter_hints = true,
        -- prefix for parameter hints
        parameter_hints_prefix = "<- ",
        -- prefix for all the other hints (type, chaining)
        other_hints_prefix = "=> ",
        -- whether to align to the length of the longest line in the file
        max_len_align = false,
        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,
        -- whether to align to the extreme right or not
        right_align = false,
        -- padding from the right if right_align is true
        right_align_padding = 7,
        -- The color of the hints highlight = "Comment",
        -- The highlight group priority for extmark
        priority = 100,
      },
    })



    require('lspconfig').clangd.setup()
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
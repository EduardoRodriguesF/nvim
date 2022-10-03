require "user.plugins"
require "user.options"
require "user.keymaps"

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

require("nvim-tree").setup()
require("nvim-autopairs").setup()
require("gitsigns").setup()

require('telescope').setup({
  defaults = {
    file_ignore_patterns = {"node_modules"}
  }
})

require("indent_blankline").setup({
  show_current_context = true,
  show_current_context_start = false
})

require("lualine").setup({
  options = {
    theme = 'omni'
  }
})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettier
  }
})

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  server:setup(opts)
end)

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettier
  }
})

local omnisharp_bin = "/home/edurf/.local/share/nvim/lsp_servers/omnisharp/omnisharp/OmniSharp"
local root_pattern = require('lspconfig.util').root_pattern

require'lspconfig'.omnisharp.setup{
  cmd = { "dotnet", omnisharp_bin },
  root_dir= function(path)
    return root_pattern('*.sln')(path) or root_pattern('*.csproj')(path)
  end
}

local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
      { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
      { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
      { name = 'cmdline' }
    })
})

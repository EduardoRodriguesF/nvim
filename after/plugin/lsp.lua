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

vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
vim.keymap.set('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>')
vim.keymap.set('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>')
vim.keymap.set('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')
vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format { async = true }<cr>')
vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<cr>')

-- LSP Enhanced keymaps
--
-- -- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the selected files
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

-- Go to definition
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
vim.keymap.set("n", "gpd", "<cmd>Lspsaga peek_definition<CR>")

-- Go To Type Definition
vim.keymap.set("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
vim.keymap.set("n", "gpt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
vim.keymap.set("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show buffer diagnostics
vim.keymap.set("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Show workspace diagnostics
vim.keymap.set("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- Show cursor diagnostics
vim.keymap.set("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
vim.keymap.set("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
vim.keymap.set("n","<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- Call hierarchy
vim.keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
vim.keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
vim.keymap.set({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")

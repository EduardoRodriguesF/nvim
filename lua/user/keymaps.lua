local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Alias for set keymap api
local keymap = vim.api.nvim_set_keymap

keymap("", "<space>", "<nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<c-h>", "<c-w>h", opts)
keymap("n", "<c-j>", "<c-w>j", opts)
keymap("n", "<c-k>", "<c-w>k", opts)
keymap("n", "<c-l>", "<c-w>l", opts)

-- Resize with arrows
keymap("n", "<c-up>", ":resize -2<cr>", opts)
keymap("n", "<c-down>", ":resize +2<cr>", opts)
keymap("n", "<c-left>", ":vertical resize -2<cr>", opts)
keymap("n", "<c-right>", ":vertical resize +2<cr>", opts)

-- Telescope plugin
keymap("n", "ff", ":Telescope find_files<cr>", opts)
keymap("n", "fg", ":Telescope live_grep<cr>", opts)
keymap("n", "fb", ":Telescope buffers<cr>", opts)
keymap("n", "fh", ":Telescope help_tags<cr>", opts)

-- Nvim Tree plugin
keymap("n", "<c-n>", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>n", ":NvimTreeFocus<cr>", opts)

-- LSP
keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format { async = true }<cr>', opts)
keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)

-- LSP Enhanced
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

-- Trouble
keymap('n', '<leader>xx', '<Cmd>TroubleToggle<CR>', opts)
keymap('n', '<leader>xw', '<Cmd>TroubleToggle workspace_diagnostics<CR>', opts)
keymap('n', '<leader>xd', '<Cmd>TroubleToggle document_diagnostics<CR>', opts)
keymap('n', '<leader>xl', '<Cmd>TroubleToggle loclist<CR>', opts)
keymap('n', '<leader>xq', '<Cmd>TroubleToggle quickfix<CR>', opts)
keymap('n', '<leader>gR', '<Cmd>TroubleToggle lsp_references<CR>', opts)

-- Insert --
-- Quickly exit mode
keymap("i", "jk", "<esc>", opts)
keymap("i", "kj", "<esc>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<a-j>", ":m .+1<cr>==", opts)
keymap("v", "<a-k>", ":m .-2<cr>==", opts)
keymap("v", "p", '"_dP', opts)

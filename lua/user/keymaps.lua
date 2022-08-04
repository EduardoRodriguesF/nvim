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

-- Navigate buffers
keymap("n", "<s-h>", ":bprevious<cr>", opts)
keymap("n", "<s-l>", ":bnext<cr>", opts)

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
keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)

-- Insert --
-- Quickly exit mode
keymap("i", "jk", "<esc>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<a-j>", ":m .+1<cr>==", opts)
keymap("v", "<a-k>", ":m .-2<cr>==", opts)
keymap("v", "p", '"_dP', opts)

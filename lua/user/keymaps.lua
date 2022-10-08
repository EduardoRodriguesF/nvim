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

-- Barbar
-- Move to previous/next
keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
keymap('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
keymap('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
keymap('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
keymap('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
keymap('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
keymap('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

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

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<a-j>", ":m .+1<cr>==", opts)
keymap("v", "<a-k>", ":m .-2<cr>==", opts)
keymap("v", "p", '"_dP', opts)

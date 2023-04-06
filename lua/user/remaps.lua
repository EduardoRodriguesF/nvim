local opts = { noremap = true, silent = true }

vim.g.mapleader = "<space>"
vim.g.maplocalleader = "<space>"

-- Normal --
-- Better window navigation
vim.keymap.set("n", "<c-h>", "<c-w>h", opts)
vim.keymap.set("n", "<c-j>", "<c-w>j", opts)
vim.keymap.set("n", "<c-k>", "<c-w>k", opts)
vim.keymap.set("n", "<c-l>", "<c-w>l", opts)

-- Resize with arrows
vim.keymap.set("n", "<c-up>", ":resize -2<cr>", opts)
vim.keymap.set("n", "<c-down>", ":resize +2<cr>", opts)
vim.keymap.set("n", "<c-left>", ":vertical resize -2<cr>", opts)
vim.keymap.set("n", "<c-right>", ":vertical resize +2<cr>", opts)

-- Insert --
-- Quickly exit mode
vim.keymap.set("i", "jk", "<esc>", opts)
vim.keymap.set("i", "kj", "<esc>", opts)

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "<a-j>", ":m .+1<cr>==", opts)
vim.keymap.set("v", "<a-k>", ":m .-2<cr>==", opts)

-- Paste without losing register
vim.keymap.set("v", "p", '"_dP', opts)

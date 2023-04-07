local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- Visual --
-- Paste without losing register
vim.keymap.set("v", "p", '"_dP', opts)

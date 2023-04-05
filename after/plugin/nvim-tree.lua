require("nvim-tree").setup()

vim.keymap.set("n", "<c-n>", ":NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>n", ":NvimTreeFocus<cr>")

require("nvim-tree").setup()

vim.keymap.set("n", "<c-n>", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeFocus)

require('telescope').setup({
  defaults = {
    file_ignore_patterns = { "node_modules" }
  }
})

vim.keymap.set("n", "ff", ":Telescope find_files<cr>")
vim.keymap.set("n", "fg", ":Telescope live_grep<cr>")
vim.keymap.set("n", "fb", ":Telescope buffers<cr>")
vim.keymap.set("n", "fh", ":Telescope help_tags<cr>")

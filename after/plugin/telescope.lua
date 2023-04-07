local builtin = require('telescope.builtin')

require('telescope').setup({
  defaults = {
    file_ignore_patterns = { "node_modules" }
  }
})

vim.keymap.set("n", "<leader>pf", builtin.find_files, {}) -- Project files
vim.keymap.set("n", "<C-p>", builtin.git_files, {}) -- Git files
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

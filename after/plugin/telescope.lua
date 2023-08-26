local builtin = require 'telescope.builtin'

require('telescope').setup {
  defaults = {
    file_ignore_patterns = { 'node_modules' },
  },
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- Project files
vim.keymap.set('n', '<C-p>', function()
  local success = pcall(builtin.git_files, {})

  if not success then
    builtin.find_files({})
  end
end) -- Git files

vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
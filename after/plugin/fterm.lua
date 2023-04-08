require 'FTerm'.setup({
  border = 'single',
  dimensions = {
    width = 0.6,
    height = 0.7,
    x = 0.5,
    y = 0.35,
  },
})

vim.keymap.set('n', '<A-d>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-d>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

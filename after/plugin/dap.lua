local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = '/opt/homebrew/opt/llvm/bin/lldb-vscode',
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

vim.keymap.set('n', '<leader>c', dap.continue)
vim.keymap.set('n', '<F9>', dap.step_over)
vim.keymap.set('n', '<F10>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>B', dap.set_breakpoint)
vim.keymap.set('n', '<leader>lp', function()
  dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end)
vim.keymap.set('n', '<leader>ro', dap.repl.open)
vim.keymap.set('n', '<leader>rl', dap.run_last)

vim.keymap.set({'n', 'v'}, '<Leader>wh', function()
  require('dap.ui.widgets').hover()
end)

vim.keymap.set({'n', 'v'}, '<Leader>wp', function()
  require('dap.ui.widgets').preview()
end)

vim.keymap.set('n', '<Leader>wf', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)

vim.keymap.set('n', '<Leader>ws', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

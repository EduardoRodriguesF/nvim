local opt = vim.opt

opt.backup = false
opt.hlsearch = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.updatetime = 300
opt.fixendofline = true
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false
opt.cursorline = true
opt.wrap = false
opt.wildignore = "*.o,*.a,*.so,*.pyc,*.swp,.git,.git/*,*.class,*/target/*,.idea/*,.vscode/*,node_modules,node_modules/*"

vim.cmd[[colorscheme omni]]
vim.cmd[[autocmd BufEnter * set fixendofline]]

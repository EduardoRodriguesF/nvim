local options = {
  backup = false,
  hlsearch = true,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  number = true,
  relativenumber = true,
  scrolloff = 8,
  sidescrolloff = 8,
  updatetime = 300,
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
  foldenable = false,
  cursorline = true,
  wrap = false,
  wildignore = "*.o,*.a,*.so,*.pyc,*.swp,.git,.git/*,*.class,*/target/*,.idea/*,.vscode/*,node_modules,node_modules/*"
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.cmd[[colorscheme omni]]

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
  foldexpr = "nvim_treesitter#foldexpr()"
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.cmd[[colorscheme omni]]

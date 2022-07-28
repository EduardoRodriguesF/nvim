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
  updatetime = 300
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

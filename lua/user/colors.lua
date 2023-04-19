function SetColorScheme(color)
  color = color or 'omni' -- Defaults to omni
  vim.cmd.colorscheme(color)

  -- Make it transparent
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

SetColorScheme()

-- https://github.com/lifepillar/vim-solarized8

return {
  'lifepillar/vim-solarized8',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    vim.cmd.colorscheme 'solarized8_flat'
  end,
}

-- indentation lines
-- https://github.com/lukas-reineke/indent-blankline.nvim

return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      -- Disabled by default, enable with <leader>ti
      enabled = false,
      indent = { char = '▏' },
    },
  },
}

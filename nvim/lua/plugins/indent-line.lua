-- https://github.com/lukas-reineke/indent-blankline.nvim

return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'VeryLazy',
    keys = {
      { '<leader>ci', '<cmd>IBLToggle<cr>', desc = '[C]hange [i]ndent blankline' },
    },
    opts = {
      -- Disabled by default, enable with <leader>ci
      enabled = false,
      indent = { char = '▏' },
    },
  },
}

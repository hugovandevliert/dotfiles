-- https://github.com/folke/which-key.nvim

return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    icons = { mappings = false },

    -- Document existing key chains
    spec = {
      { '<leader>c', group = '[C]hange' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]est' },
      { '<leader>g', group = '[G]it', mode = { 'n', 'v' } },
    },
  },
}

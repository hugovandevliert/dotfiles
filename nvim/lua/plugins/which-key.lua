-- https://github.com/folke/which-key.nvim

return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    icons = { mappings = false },

    -- Document existing key chains
    spec = {
      { '<leader>c', group = '[C]opy' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [h]unk', mode = { 'n', 'v' } },
    },
  },
}

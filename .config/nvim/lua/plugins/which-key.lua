-- https://github.com/folke/which-key.nvim

return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    icons = { mappings = false },

    -- Document existing key chains
    spec = {
      { '<leader>c', group = '[C]hange' },
      { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
      { '<leader>t', group = '[T]est' },
      { '<leader>g', group = '[G]it', mode = { 'n', 'v' } },
      { 'gr', group = 'LSP' },
      { 'grn', desc = 'LSP: [R]e[n]ame' },
      { 'gra', desc = 'LSP: Code [a]ction', mode = { 'n', 'x' } },
      { 'grx', desc = 'LSP: Run code lens' },
    },
  },
}

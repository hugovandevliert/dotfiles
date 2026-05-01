-- https://github.com/brenoprata10/nvim-highlight-colors

return {
  'brenoprata10/nvim-highlight-colors',
  event = 'VeryLazy',
  keys = {
    { '<leader>cp', '<cmd>HighlightColors Toggle<cr>', desc = '[C]hange color [p]reviews' },
  },
}

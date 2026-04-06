-- https://github.com/folke/todo-comments.nvim

return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    highlight = {
      keyword = 'fg',
      after = '',
    },
    signs = false,
  },
}

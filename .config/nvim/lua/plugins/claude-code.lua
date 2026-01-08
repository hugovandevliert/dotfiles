-- https://github.com/greggh/claude-code.nvim

return {
  'greggh/claude-code.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required for git operations
  },
  opts = {
    window = {
      split_ratio = 0.4,
    },
    keymaps = {
      toggle = {
        normal = '<C-\\>',
        terminal = '<C-\\>',
      },
    },
  },
}

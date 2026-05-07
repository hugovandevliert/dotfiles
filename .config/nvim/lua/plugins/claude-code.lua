-- https://github.com/greggh/claude-code.nvim

return {
  'greggh/claude-code.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required for git operations
  },
  opts = {
    window = {
      split_ratio = 0.5,
    },
    keymaps = {
      toggle = {
        normal = '<C-\\>',
        terminal = '<C-\\>',
        variants = {
          continue = '<C-S-\\>',
          verbose = false,
        },
      },
    },
  },
  config = function(_, opts)
    local claude_code = require('claude-code')
    claude_code.setup(opts)
    -- Don't drag us back into insert mode on focus
    claude_code.force_insert_mode = function() end
  end,
}

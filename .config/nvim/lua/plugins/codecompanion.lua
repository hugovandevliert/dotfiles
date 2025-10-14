-- https://github.com/olimorris/codecompanion.nvim

return {
  'olimorris/codecompanion.nvim',
  opts = {},
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('codecompanion').setup({
      memory = {
        default = {
          description = 'Collection of common files for all projects',
          files = {
            '.github/copilot-instructions.md',
            'AGENT.md',
            'AGENTS.md',
          },
        },
        opts = {
          chat = { enabled = true },
        },
      },
      strategies = {
        chat = {
          keymaps = {
            clear = {
              modes = { n = 'gq' },
            },
          },
        },
      },
    })

    vim.keymap.set('n', '<Leader>a', '<cmd>CodeCompanionChat Toggle<cr>', { silent = true, desc = 'Toggle [A]I chat' })
    vim.keymap.set('v', 'ga', '<cmd>CodeCompanionChat Add<cr>', { silent = true, desc = 'Add selection to [A]I chat' })

    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd([[cab cc CodeCompanion]])
  end,
}

-- Adds git related signs to the gutter, as well as utilities for managing changes
-- https://github.com/lewis6991/gitsigns.nvim

return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '|' },
      change = { text = '|' },
      delete = { text = '|' },
      topdelete = { text = '|' },
      changedelete = { text = '|' },
    },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to next git [c]hange' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to previous git [c]hange' })

      -- Actions
      -- visual mode
      map('v', '<leader>hs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Git [s]tage hunk' })
      map('v', '<leader>hr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Git [r]eset hunk' })
      -- normal mode
      map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Git [s]tage hunk' })
      map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Git [r]eset hunk' })
      map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Git [s]tage buffer' })
      map('n', '<leader>hu', gitsigns.stage_hunk, { desc = 'Git [u]ndo stage hunk' })
      map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Git [r]eset buffer' })
      map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Git [p]review hunk' })
      map('n', '<leader>hb', gitsigns.blame_line, { desc = 'Git [b]lame line' })
      map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Git [d]iff against index' })
      map('n', '<leader>hD', function()
        gitsigns.diffthis '@'
      end, { desc = 'Git [d]iff against last commit' })
      -- Toggles
      map('n', '<leader>cb', gitsigns.toggle_current_line_blame, { desc = '[C]hange git show [b]lame line' })
      map('n', '<leader>cD', gitsigns.preview_hunk_inline, { desc = '[C]hange git show [d]eleted' })
    end,
  },
}

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
      local gitsigns = require('gitsigns')

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal({ ']c', bang = true })
        else
          gitsigns.nav_hunk('next')
        end
      end, { desc = 'Jump to next git [c]hange' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal({ '[c', bang = true })
        else
          gitsigns.nav_hunk('prev')
        end
      end, { desc = 'Jump to previous git [c]hange' })

      -- Actions
      -- visual mode
      map('v', '<leader>gr', function()
        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, { desc = '[G]it [r]eset hunk' })
      -- normal mode
      map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[G]it [r]eset hunk' })
      map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[G]it [r]eset buffer' })
      map('n', '<leader>gp', gitsigns.preview_hunk_inline, { desc = '[G]it [p]review hunk' })
      map('n', '<leader>gb', gitsigns.blame_line, { desc = '[G]it [b]lame line' })
      map('n', '<leader>gB', gitsigns.blame, { desc = '[G]it [b]lame buffer' })
      map('n', '<leader>gd', gitsigns.diffthis, { desc = '[G]it [d]iff against index' })
      map('n', '<leader>gD', function()
        gitsigns.diffthis('@')
      end, { desc = '[G]it [d]iff against last commit' })
      -- Toggles
      map('n', '<leader>cb', gitsigns.toggle_current_line_blame, { desc = '[C]hange git show [b]lame line' })
    end,
  },
}

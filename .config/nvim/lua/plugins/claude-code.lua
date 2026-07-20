-- https://github.com/coder/claudecode.nvim

return {
  'coder/claudecode.nvim',
  opts = {
    terminal = {
      split_side = 'right',
      split_width_percentage = 0.5,
      provider = 'native',
    },
  },
  keys = {
    { '<C-\\>', '<cmd>ClaudeCode<cr>', mode = { 'n', 't' }, desc = 'Toggle Claude Code' },
    { '<C-S-\\>', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude Code' },
  },
  config = function(_, opts)
    require('claudecode').setup(opts)

    -- Window navigation from the Claude terminal only.
    vim.api.nvim_create_autocmd('TermOpen', {
      callback = function(args)
        if not vim.api.nvim_buf_get_name(args.buf):match('claude') then
          return
        end
        for _, key in ipairs({ 'h', 'j', 'k', 'l' }) do
          vim.keymap.set('t', '<C-' .. key .. '>', '<C-\\><C-n><C-w>' .. key, { buffer = args.buf })
        end
      end,
    })
  end,
}

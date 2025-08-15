-- https://github.com/ibhagwan/fzf-lua

return {
  'ibhagwan/fzf-lua',
  event = 'VimEnter',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local fzf = require('fzf-lua')
    fzf.setup({
      winopts = {
        preview = { layout = 'vertical' },
      },
      files = { git_icons = true },
    })

    -- Key mappings
    vim.keymap.set('n', '<leader>sh', fzf.help_tags, { desc = '[S]earch [h]elp' })
    vim.keymap.set('n', '<leader>sk', fzf.keymaps, { desc = '[S]earch [k]eymaps' })
    -- NOTE: In the old vim setup, we default to git_files instead of files here, for performance reasons.
    -- Let's revert to that if this turns out to be too slow.
    vim.keymap.set('n', '<leader>sf', fzf.files, { desc = '[S]earch [f]iles' })
    vim.keymap.set('n', '<leader>ss', fzf.git_status, { desc = '[S]earch git [s]tatus' })
    vim.keymap.set('n', '<leader>sb', fzf.builtin, { desc = '[S]earch [b]uiltin FZF-Lua' })
    vim.keymap.set('n', '<leader>sw', fzf.grep_cword, { desc = '[S]earch current [w]ord' })
    vim.keymap.set('n', '<leader>sg', fzf.live_grep_native, { desc = '[S]earch by [g]rep' })
    vim.keymap.set('n', '<leader>sd', fzf.diagnostics_document, { desc = '[S]earch [d]ocument diagnostics' })
    vim.keymap.set('n', '<leader>sr', fzf.resume, { desc = '[S]earch [r]esume' })
    vim.keymap.set('n', '<leader>sy', fzf.oldfiles, { desc = '[S]earch histor[y]' })
    vim.keymap.set('n', '<leader><leader>', fzf.buffers, { desc = '[ ] Search existing buffers' })
    vim.keymap.set('n', '<leader>/', fzf.blines, { desc = '[/] Fuzzily search in current buffer' })
    vim.keymap.set('n', '<leader>s/', function()
      fzf.live_grep({ grep_opts = '--no-ignore --hidden --exclude ".git"' })
    end, { desc = '[S]earch [/] in Open Files' })

    vim.keymap.set('n', '<leader>sn', function()
      fzf.files({ cwd = vim.fn.stdpath('config') })
    end, { desc = '[S]earch [n]eovim files' })
  end,
}

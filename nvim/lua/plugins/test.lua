-- https://github.com/vim-test/vim-test

return {
  'vim-test/vim-test',
  event = 'VeryLazy',
  config = function()
    vim.g['test#strategy'] = 'neovim_sticky'
    vim.g['test#echo_command'] = 0
    vim.g['test#preserve_screen'] = 0
    vim.g['test#neovim_sticky#reopen_window'] = 1
    vim.g['test#neovim_sticky#kill_previous'] = 1

    vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>', { silent = true, desc = '[T]est [n]earest' })
    vim.keymap.set('n', '<leader>tf', ':TestFile<CR>', { silent = true, desc = '[T]est [f]ile' })
    vim.keymap.set('n', '<leader>tp', ':TestLast<CR>', { silent = true, desc = '[T]est [l]ast' })
    vim.keymap.set('n', '<leader>tv', ':TestVisit<CR>', { silent = true, desc = '[T]est [v]isit last test file' })
  end,
}

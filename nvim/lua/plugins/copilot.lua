-- https://github.com/github/copilot.vim

return {
  'github/copilot.vim',
  config = function()
    vim.g.copilot_workspace_folders = { '~/dev/floryn' }

    vim.keymap.set('i', '<C-J>', '<Plug>(copilot-next)')
    vim.keymap.set('i', '<C-K>', '<Plug>(copilot-previous)')
    vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
  end,
}

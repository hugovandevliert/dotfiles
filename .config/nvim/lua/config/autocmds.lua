-- Highlight when yanking text
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Automatically equalise splits when Vim is resized
vim.api.nvim_create_autocmd('VimResized', {
  callback = function()
    vim.cmd('wincmd =')
  end,
})

-- Disable spell checking in terminal windows
vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- Disable spell checking in man page buffers
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'man',
  callback = function()
    vim.opt_local.spell = false
  end,
})

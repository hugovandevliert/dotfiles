-- Highlight when yanking text
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

-- Auto-create directories when saving a file
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function(event)
    if event.match:match('^%w%w+:[\\/][\\/]') then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})

-- Restore cursor position when reopening a file
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Restore signcolumn and number when entering non-terminal buffers
-- (fixes issue where opening files from a terminal buffer inherits its settings)
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    if vim.bo.buftype ~= 'terminal' then
      vim.wo.signcolumn = 'yes'
      vim.wo.number = true
    end
  end,
})

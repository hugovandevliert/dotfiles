-- Quick saving and quitting
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = '[W]rite' })
vim.keymap.set('n', '<leader>q', '<cmd>confirm q<cr>', { desc = '[Q]uit' })
vim.keymap.set('n', '<leader>x', '<cmd>x<cr>', { desc = '[X] Write and quit' })

-- Sane movement when wrap is enabled
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Indent without losing selection
vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')

-- Sort selected lines
vim.keymap.set('x', 'gs', ':sort<CR>', { desc = 'Sort lines', silent = true })

-- Paste without adding to the register in visual mode
vim.keymap.set('x', 'p', function()
  return 'pgv"' .. vim.v.register .. 'y`>'
end, { expr = true })
vim.keymap.set('x', 'P', function()
  return 'Pgv"' .. vim.v.register .. 'y`>'
end, { expr = true })

-- Exit terminal mode in the builtin terminal with <Esc>
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Copy relative path to system clipboard
vim.keymap.set('n', '<leader>p', function()
  vim.fn.setreg('+', vim.fn.expand('%:.'))
  vim.cmd('echo "Copied file path to clipboard."')
end, { desc = 'Copy relative file [p]ath to clipboard', silent = true })

-- Jump to the next or previous diagnostic
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = 'Jump to the next diagnostic' })
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = 'Jump to the previous diagnostic' })
vim.keymap.del('n', ']D')
vim.keymap.del('n', '[D')

-- [[ Toggles ]]
-- Toggle spell check
vim.keymap.set('n', '<leader>cs', '<cmd>set spell!<CR>', { desc = '[C]hange [s]pell check', silent = true })

-- Toggle colorcolumn
vim.keymap.set('n', '<leader>cc', function()
  vim.opt.colorcolumn = vim.opt.colorcolumn:get()[1] == '80' and '' or '80'
end, { desc = '[C]hange [c]olorcolumn', silent = true })

-- Toggle line wrap
vim.keymap.set('n', '<leader>cw', '<cmd>set wrap!<CR>', { desc = '[C]hange line [w]rap', silent = true })

-- Toggle listchars
vim.keymap.set('n', '<leader>cl', ':set list!<CR>', { desc = '[C]hange [l]ist chars', silent = true })

-- Toggle diagnostics
vim.keymap.set('n', '<leader>cd', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = '[C]hange [d]iagnostics', silent = true })

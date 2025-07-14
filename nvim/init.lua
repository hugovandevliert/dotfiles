-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- Make line numbers default
vim.o.number = true

-- Minimal number of screen lines to keep above and below the cursor
vim.o.scrolloff = 4

-- Scroll left/right one character at a time
vim.o.sidescroll = 1

-- Keep a few characters visible to the left and right of the cursor
vim.o.sidescrolloff = 4

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Disable swap files
vim.o.swapfile = false

-- Save undo history
vim.o.undofile = true
vim.o.undodir = vim.fs.normalize('~/.config/nvim/undo')

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 200
vim.o.timeoutlen = 200

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Display certain whitespace characters
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Use two spaces for a tab
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Enable spell checking for English and Dutch
vim.o.spell = true
vim.o.spelllang = 'en,nl'

-- Disable wrap by default
vim.o.wrap = false

-- Delete comment character when joining commented lines
vim.opt.formatoptions:append('j')

-- Don't include newline characters in visual mode
vim.o.selection = 'old'

-- Allow virtual editing in block mode
vim.o.virtualedit = 'block'

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = '[W]rite'})
vim.keymap.set('n', '<leader>q', '<cmd>confirm q<cr>', { desc = '[Q]uit'})

-- Sane movement when wrap is enabled
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Indent without losing selection
vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')

-- Paste without adding to the register in visual mode
vim.keymap.set('x', 'p', function()
  return 'pgv"' .. vim.v.register .. 'y`>'
end, { expr = true })
vim.keymap.set('x', 'P', function()
  return 'Pgv"' .. vim.v.register .. 'y`>'
end, { expr = true })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Copy relative path to system clipboard
vim.keymap.set('n', '<leader>cf', function()
  vim.fn.setreg('+', vim.fn.expand('%:.'))
  vim.cmd('echo "copied path to clipboard."')
end, { desc = '[C]opy relative [f]ile path to clipboard', silent = true })

-- Toggle spell check
vim.keymap.set('n', '<leader>ts', '<cmd>set spell!<CR>', { desc = '[T]oggle [s]pell check', silent = true })

-- Toggle colorcolumn
vim.keymap.set('n', '<leader>tc', function()
  vim.opt.colorcolumn = vim.opt.colorcolumn:get()[1] == '80' and '' or '80'
end, { desc = '[T]oggle [c]olorcolumn at 80', silent = true })

-- Toggle line wrap
vim.keymap.set('n', '<leader>tw', '<cmd>set wrap!<CR>', { desc = '[T]oggle line [w]rap', silent = true })

-- Toggle listchars
vim.keymap.set('n', '<leader>tl', ':set list!<CR>', { desc = '[T]oggle [l]ist chars', silent = true })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
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

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup('plugins', {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

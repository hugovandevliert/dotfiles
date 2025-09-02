-- Make line numbers default
vim.o.number = true

-- Minimal number of screen lines to keep above and below the cursor
vim.o.scrolloff = 4

-- Keep a few characters visible to the left and right of the cursor
vim.o.sidescrolloff = 4

-- Scroll left/right one character at a time
vim.o.sidescroll = 1

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

-- Assume the /g flag on :s substitutions
vim.o.gdefault = true

-- Disable swap files
vim.o.swapfile = false

-- Save undo history
vim.o.undofile = true

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

-- Configure folding with Treesitter
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldtext = ''
vim.o.foldlevel = 99

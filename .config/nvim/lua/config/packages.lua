-- Built-in packages (opt-in plugins shipped with Neovim)

vim.cmd.packadd('nvim.undotree')
vim.keymap.set('n', '<leader>u', '<cmd>Undotree<CR>', { desc = '[U]ndo tree' })

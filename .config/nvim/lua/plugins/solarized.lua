-- https://github.com/lifepillar/vim-solarized8
--
-- Note: there's currently a bug in neovim that causes the colorscheme to load
-- twice on launch, which can cause flickering since it defaults to a dark theme.
-- See: https://github.com/neovim/neovim/issues/32109

return {
  'lifepillar/vim-solarized8',
  priority = 1000,
  branch = 'neovim',
  config = function()
    vim.cmd.colorscheme('solarized8_flat')

    -- Hide cursor in terminal mode so it matches the regular cursor. This needs
    -- to be done in an autocmd because of the reloading bug mentioned above.
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        vim.api.nvim_set_hl(0, 'TermCursor', { blend = 100 })
      end,
    })
  end,
}

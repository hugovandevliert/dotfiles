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

    -- These need to be in an autocmd because of the reloading bug linked above.
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        -- Hide cursor in terminal mode so it matches the regular cursor.
        vim.api.nvim_set_hl(0, 'TermCursor', { blend = 100 })

        -- Unlink @variable from Normal to prevent overriding the cursorline bg.
        vim.api.nvim_set_hl(0, '@variable', {})
      end,
    })
  end,
}

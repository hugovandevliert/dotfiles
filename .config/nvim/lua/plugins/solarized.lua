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
    -- Fix highlight groups that are overridden by Neovim 0.10+ default colorscheme.
    -- See: https://github.com/neovim/neovim/issues/26378
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = 'solarized8*',
      callback = function()
        local hl = vim.api.nvim_set_hl
        hl(0, 'NormalFloat', { link = 'Pmenu' })
        hl(0, 'FloatBorder', { link = 'WinSeparator' })
        hl(0, 'FloatTitle', { link = 'Title' })
      end,
    })

    vim.cmd.colorscheme('solarized8_flat')
  end,
}

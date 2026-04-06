-- https://codeberg.org/lifepillar/vim-solarized8

return {
  'https://codeberg.org/lifepillar/vim-solarized8',
  priority = 1000,
  branch = 'neovim',
  config = function()
    vim.cmd.colorscheme('solarized8_flat')

    -- Hide cursor in terminal mode so it matches the regular cursor.
    vim.api.nvim_set_hl(0, 'TermCursor', { blend = 100 })

    -- Unlink @variable from Normal to prevent overriding the cursorline bg.
    vim.api.nvim_set_hl(0, '@variable', {})

    -- Clear backgrounds that don't match the window background.
    vim.api.nvim_set_hl(0, 'SpecialKey', { fg = '#657b83', bold = true })
  end,
}

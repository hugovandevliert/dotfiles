-- https://github.com/tpope/vim-rails

return {
  'tpope/vim-rails',
  config = function()
    -- Add custom path additions for Rails
    vim.g.rails_path_additions = { 'app/*/*' }

    -- eruby.yml files are not supported by treesitter
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'eruby.yaml',
      command = 'set filetype=yaml',
    })
  end,
}

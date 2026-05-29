-- https://github.com/tpope/vim-rails

return {
  'tpope/vim-rails',
  config = function()
    -- Add custom path additions for Rails
    vim.g.rails_path_additions = { 'app/*/*' }

    -- Jump between controllers and their request/controller specs
    vim.g.rails_projections = {
      ['app/controllers/*_controller.rb'] = {
        alternate = {
          'spec/requests/{}_controller_spec.rb',
          'spec/controllers/{}_controller_spec.rb',
        },
      },
      ['spec/controllers/*_controller_spec.rb'] = {
        alternate = { 'app/controllers/{}_controller.rb' },
      },
      ['spec/requests/*_controller_spec.rb'] = {
        alternate = { 'app/controllers/{}_controller.rb' },
      },
    }

    -- eruby.yml files are not supported by treesitter
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'eruby.yaml',
      command = 'set filetype=yaml',
    })
  end,
}

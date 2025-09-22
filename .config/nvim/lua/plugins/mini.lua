-- Collection of various small independent plugins/modules
-- https://github.com/nvim-mini/mini.nvim

return {
  'nvim-mini/mini.nvim',
  config = function()
    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    require('mini.surround').setup({
      custom_surroundings = {
        ['('] = { output = { left = '( ', right = ' )' } },
        ['['] = { output = { left = '[ ', right = ' ]' } },
        ['{'] = { output = { left = '{ ', right = ' }' } },
        ['<'] = { output = { left = '< ', right = ' >' } },
      },
      mappings = {
        add = 'ys',
        delete = 'ds',
        find = '',
        find_left = '',
        highlight = '',
        replace = 'cs',
        update_n_lines = '',
      },
      search_method = 'cover_or_next',
    })
    vim.keymap.del('x', 'ys')
    vim.keymap.set('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })

    -- Statusline
    local statusline = require('mini.statusline')
    statusline.setup({ use_icons = true })
    statusline.section_git = function()
      return ''
    end

    -- Split and join arguments with gJ
    require('mini.splitjoin').setup({
      mappings = { toggle = 'gJ' },
    })
  end,
}

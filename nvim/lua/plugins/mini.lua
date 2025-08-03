-- Collection of various small independent plugins/modules
-- https://github.com/echasnovski/mini.nvim

return  {
  'echasnovski/mini.nvim',
  config = function()
    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    require('mini.surround').setup()

    -- Statusline
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = true }
    statusline.section_git = function() return '' end

    -- Split and join arguments with gS
    require('mini.splitjoin').setup()
  end,
}

-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false, -- neotree lazy-loads itself
  keys = {
    { '\\', ':Neotree reveal toggle<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        always_show_by_pattern = { '.env*' },
      },
      window = {
        mappings = {
          ['#'] = 'none',
          ['/'] = 'none',
          ['<2-LeftMouse>'] = 'none',
          ['<C-x>'] = 'none',
          ['D'] = 'none',
          ['S'] = 'none',
          ['\\'] = 'close_window',
          ['f'] = 'none',
          ['s'] = 'open_split',
          ['v'] = 'open_vsplit',
          ['w'] = 'none',
        },
      },
    },
  },
}

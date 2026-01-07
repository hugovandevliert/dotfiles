-- https://github.com/xzbdmw/clasp.nvim

return {
  'xzbdmw/clasp.nvim',
  opts = {
    pairs = {
      ['{'] = '}',
      ['"'] = '"',
      ["'"] = "'",
      ['('] = ')',
      ['['] = ']',
      ['<'] = '>',
    },
    keep_insert_mode = true,
    remove_pattern = nil,
  },
  config = function()
    vim.keymap.set('i', '<c-l>', function()
      require('clasp').wrap('next')
    end)

    vim.keymap.set('i', '<c-;>', function()
      require('clasp').wrap('prev')
    end)
  end,
}

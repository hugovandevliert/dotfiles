-- https://github.com/cohama/lexima.vim

return {
  'cohama/lexima.vim',
  config = function()
    local erb = { 'eruby', 'erb', 'ruby' }

    -- ERB tag autocompletion: <% %>, <%= %>, <%# %>
    vim.fn['lexima#add_rule']({ char = '%', at = '<\\%#', input_after = '%>', filetype = erb })

    -- Space adds padding on both sides: <% | %>, <%= | %>
    vim.fn['lexima#add_rule']({ char = '<Space>', at = '<%.*\\%#%>', input_after = ' ', filetype = erb })
  end,
}

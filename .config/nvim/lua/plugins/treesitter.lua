-- https://github.com/nvim-treesitter/nvim-treesitter

return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install({
        'bash',
        'diff',
        'embedded_template',
        'git_config',
        'git_rebase',
        'gitcommit',
        'gitignore',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'query',
        'ruby',
        'scss',
        'sql',
        'swift',
        'typescript',
        'vim',
        'yaml',
      })

      -- Filetypes whose Treesitter indentation is worse than the built-in.
      local no_ts_indent = { slim = true, ruby = true, yaml = true }
      -- Filetypes whose Treesitter highlighting is worse than the built-in.
      local no_ts_highlight = { csv = true }
      -- Treesitter highlighting clears :syntax and with it synID(). Re-enable
      -- legacy syntax for filetypes whose tooling depends on synID(), like
      -- ruby's indent rules, and vim-rails' gf in eruby.
      local syntax_on = { ruby = true, eruby = true }

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local buf, filetype = args.buf, args.match
          if no_ts_highlight[filetype] then
            return
          end

          -- language.add returns false when the parser isn't installed; bail
          -- before start() so legacy :syntax stays on instead of a blank buffer.
          local language = vim.treesitter.language.get_lang(filetype)
          if not language or not vim.treesitter.language.add(language) then
            return
          end

          vim.treesitter.start(buf, language)

          if not no_ts_indent[filetype] and vim.treesitter.query.get(language, 'indents') then
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
          if syntax_on[filetype] then
            vim.bo[buf].syntax = 'on'
          end
        end,
      })
    end,
  },
}

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
        'sql',
        'swift',
        'typescript',
        'vim',
        'yaml',
      })

      local no_ts_highlight = { csv = true }
      local no_ts_indent = { slim = true, ruby = true }

      local function treesitter_try_attach(buf, language)
        local filetype = vim.bo[buf].filetype

        if no_ts_highlight[filetype] then
          return
        end
        if not vim.treesitter.language.add(language) then
          return
        end

        vim.treesitter.start(buf, language)

        if not no_ts_indent[filetype] then
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end

        -- Ruby depends on vim's regex highlighting for indent rules
        if filetype == 'ruby' then
          vim.bo[buf].syntax = 'on'
        end
      end

      local available_parsers = require('nvim-treesitter').get_available()
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local buf, filetype = args.buf, args.match
          local language = vim.treesitter.language.get_lang(filetype)
          if not language then
            return
          end

          local installed_parsers = require('nvim-treesitter').get_installed('parsers')

          if vim.tbl_contains(installed_parsers, language) then
            treesitter_try_attach(buf, language)
          elseif vim.tbl_contains(available_parsers, language) then
            require('nvim-treesitter').install(language):await(function()
              treesitter_try_attach(buf, language)
            end)
          else
            treesitter_try_attach(buf, language)
          end
        end,
      })
    end,
  },
}

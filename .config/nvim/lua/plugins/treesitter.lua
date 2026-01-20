-- https://github.com/nvim-treesitter/nvim-treesitter

return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = {
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
      },
      auto_install = true,
      highlight = {
        enable = true,
        disable = { 'csv' },
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'slim', 'ruby' } },
    },
  },
}

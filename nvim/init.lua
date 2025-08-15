-- Set <space> as the leader key
-- Has to be set before loading lazy
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('config.lazy')
require('config.options')
require('config.mappings')
require('config.autocmds')

-- Cache compiled Lua modules for faster startup
vim.loader.enable()

require('config.lazy')
require('config.options')
require('config.mappings')
require('config.autocmds')
require('config.packages')

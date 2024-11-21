
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]])
require('packer').startup(function(use)
	local plugins = require('config.plugins')

end)
vim.cmd [[colorscheme moonfly]]
require("config.mappings")
require('config.treesitter')
require('config.cmp')
require('config.lsp')



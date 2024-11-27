-- treesitter.lua

require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "python", "javascript" },
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
}


-- Load Packer
vim.cmd [[packadd packer.nvim]]

-- Configure Packer
require('packer').startup(function(use)
    require('config.plugins')(use)
end)

-- General Settings
vim.o.number = true                -- Enable line numbers
vim.o.relativenumber = true        -- Relative line numbers
vim.o.tabstop = 4                  -- Number of spaces for a tab
vim.o.shiftwidth = 4               -- Number of spaces for autoindent
vim.o.expandtab = true             -- Use spaces instead of tabs
vim.o.smartindent = true           -- Enable smart indenting
vim.o.mouse = 'a'                  -- Enable mouse support
vim.o.clipboard = 'unnamedplus'    -- Use system clipboard

-- Keymaps
vim.g.mapleader = ' '              -- Leader key
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Colorscheme
pcall(vim.cmd, "colorscheme moonfly") -- Apply colorscheme (safe in case not installed)

-- Autocommands (Optional Example)
vim.cmd [[
  augroup AutoReloadConfig
    autocmd!
    autocmd BufWritePost init.lua source %
  augroup END
]]

-- Lazy-load plugin configs (Optional Performance Improvement)
pcall(function()
    require('config.telescope')     -- Telescope setup
    require('config.treesitter')    -- Treesitter setup
    require('config.lsp')           -- LSP setup
    require('config.nvim-tree')     -- Nvim-tree setup
end)


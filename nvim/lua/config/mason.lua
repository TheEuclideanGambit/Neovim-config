-- lua/config/mason.lua

-- Use protected call to require 'mason'
local mason_status_ok, mason = pcall(require, 'mason')
if not mason_status_ok then
    vim.notify('mason.nvim not found!', vim.log.levels.ERROR)
    return
end

mason.setup()


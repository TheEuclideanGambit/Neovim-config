-- lsp.lua

local lsp_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_status_ok then
    vim.notify('nvim-lspconfig not found!', vim.log.levels.ERROR)
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_nvim_lsp_ok then
    capabilities = cmp_nvim_lsp.default_capabilities()
end

local on_attach = function(client, bufnr)
    local buf_set_keymap = function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

local servers = {
    'lua_ls', 'pyright', 'ts_ls', 'rust_analyzer', 'bashls', 'ruff',
    'jedi_language_server', 'dockerls', 'gopls', 'clangd', 'html', 'cssls',
    'jsonls', 'yamlls', 'marksman', 'intelephense', 'solargraph', 'jdtls',
    'perlnavigator', 'texlab', 'hls', 'elixirls', 'kotlin_language_server',
    'r_language_server', 'julials',
}

for _, server in ipairs(servers) do
    local opts = {
        capabilities = capabilities,
        on_attach = on_attach,
    }

    if server == 'lua_ls' then
        opts.settings = {
            Lua = {
                diagnostics = { globals = { 'vim' } },
            },
        }
    end

    lspconfig[server].setup(opts)
end


local lspconfig = require'lspconfig'
require('mason-lspconfig').setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = function(client, bufnr)
				-- LSP key mappings
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
				-- Additional LSP mappings...
			end,
			capabilities = require'cmp_nvim_lsp'.default_capabilities(),
		})
	end
})

lspconfig.pyright.setup{
	capabilities = capabilities,
}
lspconfig.ts_ls.setup{
	capabilities = capabilities,
}
lspconfig.clangd.setup{}


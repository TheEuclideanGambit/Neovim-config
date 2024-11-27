-- cmp.lua

local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'


local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
	local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	completion = { completeopt = 'menu,menuone,noinsert' },
	mapping = {
		['<C-f>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),

		['<C-n>'] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<C-p>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<C-e>'] = cmp.mapping.abort(),
		['<c-y>'] = cmp.mapping.confirm { select = true },
		["<CR>"] = function(fallback)
			if cmp.visible() and cmp.get_active_entry() then
				cmp.confirm({ select = false })
			else
				fallback()
			end
		end,
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<C-l>'] = cmp.mapping(function()
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { 'i', 's' }),
		['<C-h>'] = cmp.mapping(function()
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { 'i', 's' }),
	},
	formatting = {
		format = lspkind.cmp_format {
			mode = 'symbol',
			symbol_map = { Copilot = "" },
			menu = {
				copilot = '[Copilot]',
				otter = '[🦦]',
				nvim_lsp = '[LSP]',
				nvim_lsp_signature_help = '[sig]',
				luasnip = '[snip]',
				buffer = '[buf]',
				path = '[path]',
				spell = '[spell]',
				pandoc_references = '[ref]',
				tags = '[tag]',
				treesitter = '[TS]',
				calc = '[calc]',
				latex_symbols = '[tex]',
				emoji = '[emoji]',
			},
		},
	},
	sources = {
		{ name = 'copilot', priorty = 1000},
		{ name = 'path' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'nvim_lsp' },
		{ name = 'luasnip', keyword_length = 3, max_item_count = 3 },
		{ name = 'pandoc_references' },
		{ name = 'buffer', keyword_length = 5, max_item_count = 3 },
		{ name = 'spell' },
		{ name = 'treesitter', keyword_length = 5, max_item_count = 3 },
		{ name = 'calc' },
		{ name = 'latex_symbols' },
		{ name = 'emoji' },
	},
	view = {
		entries = 'native',
	},
	window = {
		documentation = {
			border = 'rounded',
		},
	},
}


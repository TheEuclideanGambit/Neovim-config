local cmp = require'cmp'

cmp.setup({
	sources = {
		{ name = 'copilot', group_index = 2 },
		{ name = 'nvim_lsp', group_index = 2},
		{ name = 'nvim_lsp_signature_help', group_index = 2},
		{ name = 'buffer', group_index = 2},
		{ name = 'path', group_index = 2},
		{ name = 'luasnip', group_index = 2},
	},
	mapping = {
		['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
	},
	window = {
		documentation = cmp.config.window.bordered(),
		winhighlight = "Normal:Normal, FloatBorder:FloatBorder, CursorLine:Visual",
		border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},  
		height = 15,
		width = 50,
	},

	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = string.format('%s %s', vim_item.kind, entry.source.name)
			return vim_item
		end,
	},
	experimental = {
		ghost_text = true,
	},
})


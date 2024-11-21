vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use { "bluz71/vim-moonfly-colors", name = "moonfly" }
	use {'ryanoasis/vim-devicons'}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = 'TSUpdate',
	}
	use {
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'saadparwaiz1/cmp_luasnip',
		'L3MON4D3/LuaSnip',
		'neovim/nvim-lspconfig',
		'nvim-lua/plenary.nvim',
	}
	use {
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup()
		end
	}
	use {
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup({
				ensure_installed = {
					'lua_ls',
					'ts_ls',
					'pyright',
					'rust_analyzer',
					'bashls',
					'ruff',
				},
				automatic_installation = true,
			})
		end
	}
	use {
		'jupyter-vim/jupyter-vim',
		run = 'pip install jupyter-vim'
	}
	use {
		'3rd/image.nvim',
	}
	use {
		'kyazdani42/nvim-web-devicons',
	}
	use {
		'nvim-tree/nvim-tree.lua',
		require('nvim-tree').setup({
			disable_netrw = true,
			hijack_netrw = true,
			open_on_tab = false,
			update_focused_file = {
				enable = true,
				update_cwd = false,
			},
		})
	}
	use {
		'nvim-tree/nvim-web-devicons',
		require('nvim-web-devicons').setup({
			default = true,
		})
	}
	use {
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({})
		end,
	}use {
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function ()
			require("copilot_cmp").setup({
				suggestion = {enabled = false},
				panel = {enabled = false},
			})
		end
	}
	use {
		'smartpde/telescope-recent-files.nvim',
	}

end, {
		config = {
			auto_clean = false,
			compile_on_sync = true,
		}
	})


return function(use)
    -- Packer itself
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function() require('config.telescope') end
    }

    -- Colorscheme
    use { "bluz71/vim-moonfly-colors", name = "moonfly" }

    -- Icons
    use 'ryanoasis/vim-devicons'
    use {
        'kyazdani42/nvim-web-devicons',
        config = function() require('nvim-web-devicons').setup({ default = true }) end
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = 'TSUpdate',
        config = function() require('config.treesitter') end
    }

    -- Completion and Snippets
    use {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/LuaSnip'
    }

    -- LSP Configuration
    use {
        'neovim/nvim-lspconfig',
        config = function() require('config.lsp') end
    }

    -- Mason for LSP management
    use {
        'williamboman/mason.nvim',
        config = function() require('config.mason') end
    }
    use {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'ts_ls', 'pyright', 'rust_analyzer', 'bashls', 'ruff' },
                automatic_installation = true,
            })
        end
    }

    -- Jupyter integration
    use {
        'jupyter-vim/jupyter-vim',
        run = 'pip install jupyter-vim'
    }

    -- Image support
    use '3rd/image.nvim'

    -- Nvim Tree
    use {
        'nvim-tree/nvim-tree.lua',
        config = function() require('config.nvim-tree') end
    }

    -- Copilot
    use {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function() require('config.copilot') end
    }
    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end
    }

    use {
        "nvim-telescope/telescope-frecency.nvim",
        requires = { "tami5/sqlite.lua" },
        config = function()
            require('telescope').load_extension('frecency')
        end
    }
end


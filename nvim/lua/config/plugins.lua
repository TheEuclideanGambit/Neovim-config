-- plugins.lua

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git',
            'clone',
            '--depth',
            '1',
            'https://github.com/wbthomason/packer.nvim',
            install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- NOTE: commented out the config within plugin calls. moved to their respective config file for cleaner code

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        requires = { 'nvim-lua/plenary.nvim' },
        -- Removed config function to prevent circular dependency
        -- config = function() require('config.telescope') end
    }

    -- Colorscheme
    use 'bluz71/vim-moonfly-colors'

    -- Icons
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        -- Removed config function
        -- config = function() require('config.treesitter') end
    }

    -- LSP and Autocompletion
    use {
		'neovim/nvim-lspconfig',
		config = function() require('config.lsp') end,
	}

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-emoji',
            'saadparwaiz1/cmp_luasnip',
            'f3fora/cmp-spell',
            'ray-x/cmp-treesitter',
            'kdheepak/cmp-latex-symbols',
            'jmbuhr/cmp-pandoc-references',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
            'onsails/lspkind-nvim',
            'jmbuhr/otter.nvim',
        },
        -- Removed config function
        -- config = function() require('config.cmp') end
    }

    -- Mason for managing external tools
    use 'williamboman/mason.nvim'

    use {
        'williamboman/mason-lspconfig.nvim',
        after = 'mason.nvim',
        config = function()
            require('mason-lspconfig').setup {
                ensure_installed = {
                    -- Original servers
                    'lua_ls', 'pyright', 'ts_ls', 'rust_analyzer', 'bashls', 'ruff',
                    -- Additional servers
                    'jedi_language_server', 'dockerls', 'gopls', 'clangd', 'html', 'cssls',
                    'jsonls', 'yamlls', 'marksman', 'intelephense', 'solargraph', 'jdtls',
                    'perlnavigator', 'texlab', 'hls', 'elixirls', 'kotlin_language_server',
                    'r_language_server', 'julials',
                },
                automatic_installation = true,
            }
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
    use 'nvim-tree/nvim-tree.lua'

    -- GitHub Copilot
    use {
        'zbirenbaum/copilot.lua',
        enabled = false,
        -- Removed config function
        -- config = function()
        --     require('copilot').setup {
        --         suggestion = {
        --             enabled = true,
        --             auto_trigger = true,
        --             debounce = 75,
        --             keymap = {
        --                 accept = '<c-a>',
        --                 accept_word = false,
        --                 accept_line = false,
        --                 next = '<M-]>',
        --                 prev = '<M-[>',
        --                 dismiss = '<C-]>',
        --             },
        --         },
        --         panel = { enabled = false },
        --     }
        -- end,
    }

    use {
        'zbirenbaum/copilot-cmp',
        after = { 'copilot.lua' },
        -- Removed config function
        -- config = function()
        --     require('copilot_cmp').setup {
        --         suggestion = { enabled = false },
        --         panel = { enabled = false },
        --     }
        -- end
    }

    -- Telescope Frecency
    use {
        'nvim-telescope/telescope-frecency.nvim',
        requires = { 'tami5/sqlite.lua' },
        -- Removed config function
        -- config = function()
        --     require('telescope').load_extension('frecency')
        -- end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)


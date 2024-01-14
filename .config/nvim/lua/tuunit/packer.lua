vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- theme
	use({
		'rebelot/kanagawa.nvim',
		config = function()
			vim.cmd('colorscheme kanagawa')
		end
	})

	-- statusline support
	use({
		'nvim-lualine/lualine.nvim',
		requires = {
			'nvim-tree/nvim-web-devicons',
			opt = true
		}
	})

	-- file browser
	use({
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons'
		}
	})

	-- fuzzy finder
	use({
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	})

	-- better language support
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	-- git support
	use('tpope/vim-fugitive')
	use('tpope/vim-rhubarb')

	-- detect tabstop and shiftwidth automatically
	use('tpope/vim-sleuth')

	-- lsp 
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			-- lsp / mason
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-nvim-lua'},

			-- snippet engine
			{'L3MON4D3/LuaSnip'},
			{'saadparwaiz1/cmp_luasnip'},

			-- adds a number of snippets
			{'rafamadriz/friendly-snippets'},

			-- lua configuration for nvim
			{'folke/neodev.nvim'},
		}
	}
end)

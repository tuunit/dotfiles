vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- theme
	use({
		"loctvl842/monokai-pro.nvim",
		config = function()
			local monokai = require('monokai-pro')
			monokai.setup({
				filter = "octagon"
			})
			monokai.load()
		end,
	})

	-- statusline support
	use({
		'nvim-lualine/lualine.nvim',
		requires = {
			'nvim-tree/nvim-web-devicons',
			opt = true,
			theme = 'monokai-pro'
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
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		requires = { { 'nvim-lua/plenary.nvim' } }
	})

	-- better language support
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

	-- git support
	use('tpope/vim-fugitive')
	use('tpope/vim-rhubarb')

	-- detect tabstop and shiftwidth automatically
	use('tpope/vim-sleuth')

	-- lsp
	use({
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			-- lsp / mason
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- snippet engine
			{ 'L3MON4D3/LuaSnip' },
			{ 'saadparwaiz1/cmp_luasnip' },

			-- adds a number of snippets
			{ 'rafamadriz/friendly-snippets' },

			-- lua configuration for nvim
			{ 'folke/neodev.nvim' },
		}
	})

	-- carbon code screenshots
	use({
		'ellisonleao/carbon-now.nvim',
		config = function()
			require('carbon-now').setup({
				options = {
					bg = 'rgba(0,0,0,0)',
					theme = 'material',
					drop_shadow = true,
					drop_shadow_blur = '68px',
					drop_shadow_offset_y = '20px',
					font_family = 'Source Code Pro',
					window_theme = 'none',
					line_numbers = true
				}
			})
		end
	})

	use("mfussenegger/nvim-dap")
	use({ "nvim-neotest/nvim-nio" })
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use({ "leoluz/nvim-dap-go" })

	use({ "github/copilot.vim" })
end)

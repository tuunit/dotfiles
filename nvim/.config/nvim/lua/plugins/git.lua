return {
	-- Git integration
	{ "tpope/vim-fugitive" },
	-- Git diff viewer
	{
		"sindrets/diffview.nvim",
		init = function()
			vim.opt.fillchars = {
				diff = "╱",
			}
			vim.opt.diffopt = {
				"internal",
				"filler",
				"closeoff",
				"context:12",
				"algorithm:histogram",
				"linematch:200",
				"indent-heuristic",
			}
		end,
	},
	-- Github integration
	{ "tpope/vim-rhubarb" },
}

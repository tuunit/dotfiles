return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--hidden",
					"--glob=!.git/",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fl", builtin.live_grep, { desc = "Live search in files" })
			vim.keymap.set("n", "<leader>fg", builtin.grep_string, { desc = "Grep string below cursor" })
			vim.keymap.set("n", "<leader>fs", function()
				builtin.grep_string({ search = vim.fn.input("Grep: ") })
			end, { desc = "Search in files" })
			vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git files" })

			vim.keymap.set("n", "<leader>?", builtin.keymaps, { desc = "Show all keymaps" })
		end,
	},
}

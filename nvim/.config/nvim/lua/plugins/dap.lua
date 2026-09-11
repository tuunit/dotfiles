return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"leoluz/nvim-dap-go",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local dapgo = require("dap-go")

			local function jump_to_go_location(silent)
				local location = vim.api.nvim_get_current_line()
				local file, line = location:match("([%w%._%-%/%\\]+%.go):(%d+)")

				if not file then
					if not silent then
						vim.notify("No Go file location on this line", vim.log.levels.WARN)
					end
					return
				end

				for _, window in ipairs(vim.api.nvim_list_wins()) do
					local filetype = vim.bo[vim.api.nvim_win_get_buf(window)].filetype
					if filetype ~= "dapui_console" and filetype ~= "dap-repl" and not filetype:match("^dapui_") then
						vim.api.nvim_set_current_win(window)
						break
					end
				end
				vim.cmd.edit(vim.fn.fnameescape(file))
				vim.api.nvim_win_set_cursor(0, { tonumber(line), 0 })
			end

			local function jump_to_go_location_at_mouse()
				local mouse = vim.fn.getmousepos()
				if mouse.winid ~= 0 and mouse.line > 0 then
					vim.api.nvim_set_current_win(mouse.winid)
					vim.api.nvim_win_set_cursor(mouse.winid, { mouse.line, mouse.column - 1 })
				end
				jump_to_go_location(true)
			end

			-- DAP output includes Go test failures as file.go:line; make them jump targets.
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "dapui_console", "dap-repl" },
				callback = function(event)
					local options = {
						buffer = event.buf,
						desc = "Debug: Jump to Go location",
					}

					vim.keymap.set("n", "gf", jump_to_go_location, {
						buffer = options.buffer,
						desc = options.desc,
					})

					if event.match == "dapui_console" or event.match == "dap-repl" then
						vim.keymap.set("n", "<LeftMouse>", jump_to_go_location_at_mouse, options)
					end
				end,
			})

			dapui.setup({
				icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
				element_mappings = {
					stacks = {
						open = { "<CR>", "<2-LeftMouse>" },
					},
				},
				controls = {
					icons = {
						pause = "⏸",
						play = "▶",
						step_into = "⏎",
						step_over = "⏭",
						step_out = "⏮",
						step_back = "b",
						run_last = "▶▶",
						terminate = "⏹",
						disconnect = "⏏",
					},
				},
			})
			dapgo.setup()

			-- Auto-open/close UI
			dap.listeners.after.event_initialized['dapui_config'] = dapui.open

			vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })

			vim.keymap.set("n", "<leader>dgt", function()
				dapgo.debug_test({
					env = {
						GINKGO_NO_COLOR = "1",
						NO_COLOR = "1",
					},
				})
			end, { desc = "Debug: Go Test" })
      vim.keymap.set("n", "<leader>?", function()
        require("dapui").eval(nil, { enter = true })
      end)

			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>B",
        function()
			  	dap.set_breakpoint(vim.fn.input("Condition: "))
			  end,
        { desc = "Debug: Toggle Conditional Breakpoint" }
      )
      vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "SignColumn", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "⭕️", texthl = "SignColumn", linehl = "", numhl = "" })

			vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Continue" })
			vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup({
				enabled = true,
				all_frames = false,
				commented = false,
        display_callback = function(variable)
          if #variable.value > 15 then
            return " " .. string.sub(variable.value, 1, 15) .. "... "
          end

          return " " .. variable.value
        end
			})
		end,
	},
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {},
  },
}

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

      
      -- Dap UI setup
      dapui.setup({
          icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
          controls = {
              icons = {
                  pause = '⏸',
                  play = '▶',
                  step_into = '⏎',
                  step_over = '⏭',
                  step_out = '⏮',
                  step_back = 'b',
                  run_last = '▶▶',
                  terminate = '⏹',
                  disconnect = '⏏',
              },
          },
      })
			dapgo.setup()

			-- Auto-open/close UI
			dap.listeners.after.event_initialized['dapui_config'] = dapui.open

			vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })

			vim.keymap.set("n", "<leader>dgt", dapgo.debug_test, { desc = "Debug: Go Test" })
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
      vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "DapBreakpointColor", linehl = "", numhl = "" })

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

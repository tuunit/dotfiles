require("dapui").setup()

local dap = require("dap")
local dapui = require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)

-- Step into
vim.keymap.set("n", "<leader>di", dap.step_into)

-- Step to the next line
vim.keymap.set("n", "<leader>dn", dap.step_over)

-- Step out
vim.keymap.set("n", "<leader>do", dap.step_out)

-- Activate / toggle the UI
vim.keymap.set("n", "<leader>du", dapui.toggle)

-- Continue or start new debug session
vim.keymap.set("n", "<leader>dc", dap.continue)

-- Stop session
vim.keymap.set("n", "<leader>dq", dap.close)

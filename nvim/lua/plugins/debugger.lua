return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	keys = {
		{ "<leader>dd", "<CMD>DapTerminate<CR>", desc = "[D]ap Terminate" },
		{ "<leader>db", "<CMD>DapToggleBreakpoint<CR>", desc = "[D]ap Toggle [B]reakpoint" },
		{ "<leader>d1", "<CMD>DapContinue<CR>", desc = "[D]ap Continue" },
		{ "<leader>d2", "<CMD>DapStepInto<CR>", desc = "[D]ap Step Into" },
		{ "<leader>d3", "<CMD>DapStepOver<CR>", desc = "[D]ap Step Over" },
		{ "<leader>d4", "<CMD>DapStepOut<CR>", desc = "[D]ap Step Out" },
		{ "<leader>d5", "<CMD>DapStepBack<CR>", desc = "[D]ap Step Back" },
		{ "<leader>dR", "<CMD>DapRestart<CR>", desc = "[D]ap [R]estart" },
		{ "<leader>dr", "<CMD>lua require('dap').run_to_cursor()<CR>", desc = "[D]ap [R]un to cursor" },
		{ "<leader>dt", "<CMD>lua require('dapui').toggle()<CR>", desc = "[D]apUI [T]oggle" },
		{ "<leader>d?", "<CMD>lua require('dapui').eval(nil, { enter = true })<CR>", desc = "[D]apUI Inspect Element" },
	},
	init = function()
		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "DapStopped", linehl = "", numhl = "" })
	end,
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		local gdb_path = vim.fn.exepath("gdb")
		dapui.setup()
		require("nvim-dap-virtual-text").setup()
		if gdb_path ~= "" then
			dap.adapters.gdb = {
				type = "executable",
				command = gdb_path,
				args = { "--interpreter=dap" },
			}
			dap.configurations.cpp = {
				{
					type = "gdb",
					name = "bats-code-library fountain_code debug",
					request = "launch",
					cwd = "${workspaceFolder}",
					localroot = "${workspaceFolder}",
					program = "~/documents/programming/c++/clickhouse_test/application-example",
					args = {},
					stopOnEntry = true,
				},
			}
			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp
		end

		dap.listeners.before.attach.dapui_config = function() dapui.open() end
		dap.listeners.before.launch.dapui_config = function() dapui.open() end
		dap.listeners.before.event_terminated.dapui_config = function()
			-- dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			--dapui.close()
		end
	end,
}

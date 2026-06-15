return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			local js_debug = vim.fn.stdpath("data")
				.. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"

			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = { js_debug, "${port}" },
				},
			}
			dap.adapters["node-terminal"] = dap.adapters["pwa-node"]

			dap.configurations.javascript = {
				{
					name = "Next.js: attach (run `node --inspect node_modules/.bin/next dev` first)",
					type = "pwa-node",
					request = "attach",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
					sourceMaps = true,
					resolveSourceMapLocations = {
						"${workspaceFolder}/**",
						"!**/node_modules/**",
					},
					skipFiles = { "<node_internals>/**", "**/node_modules/**" },
				},
				{
					name = "Next.js: launch server-side",
					type = "pwa-node",
					request = "launch",
					runtimeExecutable = "node",
					runtimeArgs = {
						"--inspect",
						"${workspaceFolder}/node_modules/.bin/next",
						"dev",
					},
					cwd = "${workspaceFolder}",
					sourceMaps = true,
					resolveSourceMapLocations = {
						"${workspaceFolder}/**",
						"!**/node_modules/**",
					},
					skipFiles = { "<node_internals>/**", "**/node_modules/**" },
					console = "integratedTerminal",
				},
			}

			for _, lang in ipairs({ "typescript", "typescriptreact", "javascriptreact" }) do
				dap.configurations[lang] = dap.configurations.javascript
			end

			dapui.setup()
			require("nvim-dap-virtual-text").setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			local map = vim.keymap.set
			map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
			map("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Condition: "))
			end, { desc = "DAP conditional breakpoint" })
			map("n", "<leader>dc", dap.continue, { desc = "DAP continue" })
			map("n", "<leader>di", dap.step_into, { desc = "DAP step into" })
			map("n", "<leader>do", dap.step_over, { desc = "DAP step over" })
			map("n", "<leader>dO", dap.step_out, { desc = "DAP step out" })
			map("n", "<leader>dr", dap.repl.open, { desc = "DAP REPL" })
			map("n", "<leader>du", dapui.toggle, { desc = "DAP UI toggle" })
			map("n", "<leader>dt", dap.terminate, { desc = "DAP terminate" })
		end,
	},
}

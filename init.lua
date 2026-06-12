require("config.lazy")
vim.g.lazygit_config = false

vim.opt.termguicolors = true
vim.cmd("colorscheme evergarden")
-- local customColor = "#1A1B27"
local customColor = "#232A2E"

vim.api.nvim_set_hl(0, "WinSeparator", { fg = customColor })
vim.api.nvim_set_hl(0, "LspFloatWinBorder", { fg = customColor })
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = customColor })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = customColor })

require("kulala").setup({
	default_env = "dev",
})

require("neo-tree").setup({
	window = {
		position = "right",
		width = 40,
		mappings = {
			["P"] = {
				"toggle_preview",
				config = {
					use_float = false,
					use_image_nvim = true,
					-- use_snacks_image = true,
					-- title = 'Neo-tree Preview',
				},
			},
		},
	},
	filesystem = {
		components = {
			icon = function(config, node, state)
				if node.type == "file" then
					return {}
				end
				return require("neo-tree.sources.common.components").icon(config, node, state)
			end,
		},
		follow_current_file = {
			enabled = true,
		},
	},
})

-- -- diff colorscheme
-- vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#20303b" })
-- vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#37222c" })
-- vim.api.nvim_set_hl(0, "DiffChange", { bg = "#1f2231" })
-- vim.api.nvim_set_hl(0, "DiffText", { bg = "#394b70" })

local dap = require("dap")
local dapui = require("dapui")

local js_debug = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"

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
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

require("nvim-dap-virtual-text").setup()

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

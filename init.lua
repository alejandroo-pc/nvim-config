require("config.lazy")
vim.opt.termguicolors = true
vim.cmd("colorscheme catppuccin-macchiato")
local customColor = "#1A1B27"

vim.api.nvim_set_hl(0, "WinSeparator", { fg = customColor })
vim.api.nvim_set_hl(0, "LspFloatWinBorder", { fg = customColor })
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = customColor })

require("neo-tree").setup({
	window = {
		position = "right",
		width = 45,
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
--
local dap = require("dap")

dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = "node",
		args = { "/Users/alejandro/workspace/cellar/js-debug/src/dapDebugServer.js", "${port}" },
	},
}

dap.adapters.chrome = {
	type = "executable",
	command = "node",
	args = { "/Users/alejandro/workspace/cellar/vscode-chrome-debug/src/chromeDebug.js" },
}

dap.configurations.javascript = {
	{
		name = "Next.js: debug server-side",
		type = "pwa-node", -- Use pwa-node for Node.js debugging
		request = "launch",
		runtimeExecutable = "npm",
		runtimeArgs = { "run", "dev" },
		cwd = vim.fn.getcwd(), -- Current working directory
	},
	{
		name = "Next.js: debug client-side",
		type = "chrome",
		request = "launch",
		url = "http://localhost:3000",
		webRoot = "${workspaceFolder}",
	},
	{
		name = "Next.js: debug full stack",
		type = "pwa-node", -- Use pwa-node for Node.js debugging
		request = "launch",
		runtimeExecutable = "npm",
		runtimeArgs = { "run", "dev" },
		cwd = vim.fn.getcwd(),
		serverReadyAction = {
			pattern = "started server on .+, url: (https?://.+)",
			uriFormat = "%s",
			action = "debugWithChrome",
		},
	},
}

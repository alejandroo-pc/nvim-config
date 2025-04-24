require("config.lazy")

vim.cmd("colorscheme poimandres")
require("neo-tree").setup({
	window = {
		position = "right",
		width = 35,
	},
	filesystem = {
		follow_current_file = {
			enabled = true,
		},
	},
})

-- diff colorscheme
vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#20303b" })
vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#37222c" })
vim.api.nvim_set_hl(0, "DiffChange", { bg = "#1f2231" })
vim.api.nvim_set_hl(0, "DiffText", { bg = "#394b70" })


dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = "node",
		args = { "/Users/alejandro/workspace/cellar/js-debug/src/dapDebugServer.js", "${port}" },
	},
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

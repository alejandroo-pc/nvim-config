return {
	{
		"mxsdev/nvim-dap-vscode-js",
		dependencies = {
			"microsoft/vscode-js-debug",
			build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
		},
		config = function()
			local dap = require("dap")
			local dap_js = require("dap-vscode-js")

			-- Setup dap-js with configuration options
			dap_js.setup({
				debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
			})

			-- Define languages for DAP configurations
			local langs = { "javascript", "typescript", "svelte", "astro" }

			for _, lang in ipairs(langs) do
				dap.configurations[lang] = {
					{
						name = "Next.js: debug server-side",
						type = "node-terminal",
						request = "launch",
						command = "npm run dev",
					},
					{
						name = "Next.js: debug client-side",
						type = "chrome",
						request = "launch",
						url = "http://localhost:3000", -- URL for client-side debugging
						webRoot = "${workspaceFolder}",
					},
					{
						name = "Next.js: debug full stack",
						type = "node-terminal",
						request = "launch",
						command = "npm run dev",
						serverReadyAction = {
							pattern = "started server on .+, url: (https?://.+)",
							uriFormat = "%s",
							action = "debugWithChrome",
						},
					},
				}
			end
		end,
	},
}

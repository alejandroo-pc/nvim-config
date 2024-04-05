return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"thenbe/neotest-playwright",
			"haydenmeade/neotest-jest",
		},
		config = function()
			require("neotest").setup({
				consumers = {
					playwright = require("neotest-playwright.consumers").consumers,
				},
				adapters = {
					require("neotest-playwright").adapter({
						playwrightCommand = "npx playwright test",
						env = { CI = true },
						cwd = function()
							return vim.fn.getcwd()
						end,
						options = {
							persist_project_selection = true,
							enable_dynamic_test_discovery = true,
						},
					}),
					require("neotest-jest")({
						jestCommand = "npm test --",
						jestConfigFile = "custom.jest.config.ts",
						env = { CI = true },
						cwd = function()
							return vim.fn.getcwd()
						end,
					}),
				},
				keys = {
					{
						"<leader>tp",
						function()
							require("neotest").playwright.attachment()
						end,
						desc = "Launch test attachment",
					},
					{
						"<leader>tl",
						function()
							require("neotest").run.run_last()
						end,
						desc = "Run Last Test",
					},
					{
						"<leader>tL",
						function()
							require("neotest").run.run_last({ strategy = "dap" })
						end,
						desc = "Debug Last Test",
					},
					{
						"<leader>tw",
						"<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
						desc = "Run Watch",
					},
				},
			})
		end,
	},
}

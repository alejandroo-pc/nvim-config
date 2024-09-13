return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"thenbe/neotest-playwright",
			"haydenmeade/neotest-jest",
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		version = "*",
		lazy = false,
		config = function()
			require("neotest").setup({
				consumers = {
					playwright = require("neotest-playwright.consumers").consumers,
				},
				adapters = {
					require("neotest-playwright").adapter({
						options = {
							persist_project_selection = true,
							enable_dynamic_test_discovery = true,
						},
						discovery = {
							enabled = false,
						},
						env = { CI = true },
						cwd = function()
							return vim.fn.getcwd()
						end,
					}),
				},
			})
			local keymap = vim.keymap
			keymap.set("n", "<leader>ta", "<cmd>NeotestPlaywrightProject<CR>", { desc = "Attatch Playwright" })
			keymap.set("n", "<leader>tf", "<cmd>NeotestPlaywrightRefresh<CR>", { desc = "Playwright Refresh" })
		end,
	},
}

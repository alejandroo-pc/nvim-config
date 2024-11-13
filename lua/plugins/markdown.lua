return {
	"MeanderingProgrammer/render-markdown.nvim",
	version = "*",
	lazy = false,

	-- Step 1: Define dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- Required for syntax highlighting
		"nvim-tree/nvim-web-devicons", -- Optional: if you prefer nvim-web-devicons
		-- "echasnovski/mini.nvim",            -- Uncomment if using the mini.nvim suite
		-- "echasnovski/mini.icons",           -- Uncomment if using standalone mini plugins
	},

	-- Step 2: Setup the plugin
	config = function()
		require("render-markdown").setup({
			only_render_image_at_cursor = true,
			file_types = { "markdown", "octo" },
			heading = { -- Step 3: Set options directly in setup
				enabled = true,
				sign = false,
				width = "block",
				min_width = 40,
			},
		})

		-- Step 4: Register language with Treesitter using Vim syntax
		vim.treesitter.language.register("markdown", "octo")
	end,
}

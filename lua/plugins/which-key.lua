return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local setup = {
				plugins = {
					marks = true,
					registers = true,
					spelling = {
						enabled = true,
						suggestions = 20,
					},
					presets = {
						operators = false,
						motions = true,
						text_objects = true,
						windows = true,
						nav = true,
						z = true,
						g = true,
					},
				},

				icons = {
					breadcrumb = "»",
					separator = "➜",
					group = "+",
				},
				layout = {
					height = { min = 4, max = 25 },
					width = { min = 20, max = 50 },
					spacing = 3,
					align = "left",
				},
				show_help = true, -- Set this to true to show help when the popup is visible
				triggers = "auto",
				mappings = {
					t = {
						name = "Terminal",
						n = { "<cmd>lua _NODE_TOGGLEm)<cr>", "Node" }, -- NodeJS Terminal
						f = { "<cmd>ToggleTerm direction=float<cr>", "Float" }, -- Floating Terminal
						h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" }, -- Horizontal Terminal
						v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" }, -- Vertical Terminal
					},
				},
			}

			local whichkey = require("which-key")
			whichkey.setup(setup)
		end,
	},
}
--

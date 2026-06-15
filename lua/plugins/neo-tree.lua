return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		window = {
			position = "right",
			width = 40,
			mappings = {
				["P"] = {
					"toggle_preview",
					config = {
						use_float = false,
						use_image_nvim = true,
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
	},
}

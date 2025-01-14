require("config.lazy")
vim.g.autoformat = false

require("bufferline").setup({
	options = {
		--separator_style = "slant",
		always_show_bufferline = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		color_icons = true,
	},
})

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


vim.cmd.colorscheme("tokyonight-moon")

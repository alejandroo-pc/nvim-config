require("config.lazy")
vim.cmd("colorscheme onedark")

require("bufferline").setup({
	options = {
		--separator_style = "slant",
		always_show_bufferline = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		color_icons = true,
	},
})

require("colorizer").setup()

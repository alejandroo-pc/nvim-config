-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd.colorscheme("tokyonight")

require("toggleterm").setup({
	open_mapping = [[<leader>t]], -- Set the open mapping to <leader>t
	start_in_insert = true,
	insert_mappings = true,
	persist_size = false,
	direction = "horizontal",
})

-- setting bufferline options
vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		separator_style = "slant",
		always_show_bufferline = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		color_icons = true,
	},
})

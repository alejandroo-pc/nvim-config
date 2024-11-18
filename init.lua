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

require("transparent").setup({
	-- table: additional groups that should be cleared
	extra_groups = {
		"NormalFloat",
		"NvimTreeNormal", -- NvimTree
	},
	-- table: groups you don't want to clear
	exclude_groups = {},
	on_clear = function() end,
})

require("transparent").clear_prefix("NeoTree")
require("transparent").clear_prefix("BufferLine")
require("transparent").clear_prefix("lualine")
require("transparent").clear_prefix("Whichkey")
require("transparent").clear_prefix("Telescope")
require("transparent").clear_prefix("mason")
require("transparent").clear_prefix("snacks")

vim.cmd.colorscheme("tokyonight-moon")

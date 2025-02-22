return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				style_preset = bufferline.style_preset.minimal,
				always_show_bufferline = true,
				show_buffer_close_icons = false,
				show_close_icon = true,
				color_icons = true,
				tab_size = 13,
			},
		})

		local keymap = vim.api.nvim_set_keymap

		keymap("n", "==", "<cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true, desc = "Move buffer right" })
		keymap("n", "--", "<cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true, desc = "Move buffer left" })
	end,
}

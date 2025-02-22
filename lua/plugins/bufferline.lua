return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				-- separator_style = "slant",
				always_show_bufferline = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				color_icons = true,
			},
		})

		local keymap = vim.api.nvim_set_keymap

		keymap("n", "==", "<cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true, desc = "Move buffer right" })
		keymap("n", "--", "<cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true, desc = "Move buffer left" })
	end,
}

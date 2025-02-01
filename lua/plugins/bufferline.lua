return {
	"akinsho/bufferline.nvim",
	version = "*",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local keymap = vim.api.nvim_set_keymap

		keymap("n", "==", "<cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true, desc = "Move buffer right" })
		keymap("n", "--", "<cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true, desc = "Move buffer left" })
	end,
}

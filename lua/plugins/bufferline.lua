return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				sort_by = "insert_after_current",
				diagnostics = "nvim_lsp",
				always_show_bufferline = true,
				show_buffer_close_icons = false,
        show_buffer_icons=false,
				-- show_close_icon = false,
				-- color_icons = true,
				tab_size = 15,
				style_preset = bufferline.style_preset.minimal,
			},
		})

		vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { underline = false })

		local keymap = vim.api.nvim_set_keymap

		keymap("n", "==", "<cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true, desc = "Move buffer right" })
		keymap("n", "--", "<cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true, desc = "Move buffer left" })
	end,
}

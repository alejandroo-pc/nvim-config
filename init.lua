require("config.lazy")

vim.cmd("colorscheme onedark")

vim.keymap.set("n", "<leader>rr", "<Plug>RestNvim", { desc = "execute request" })
vim.keymap.set("n", "<leader>rp", "<Plug>RestNvimPreview", { desc = "preview curl" })
vim.keymap.set("n", "<leader>rl", "<Plug>RestNvimLast", { desc = "repeat last request" })

require("bufferline").setup({
	options = {
		--separator_style = "slant",
		always_show_bufferline = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		color_icons = true,
	},
})

-- cursor for icon for insert and normal mode
local autocmd = vim.api.nvim_create_autocmd
autocmd({ "ModeChanged" }, {
	callback = function()
		local current_mode = vim.fn.mode()
		if current_mode == "n" then
			vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#8aa872" })
			vim.fn.sign_define("smoothcursor", { text = "" })
		elseif current_mode == "v" then
			vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#bf616a" })
			vim.fn.sign_define("smoothcursor", { text = "" })
		elseif current_mode == "V" then
			vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#bf616a" })
			vim.fn.sign_define("smoothcursor", { text = "" })
		elseif current_mode == "�" then
			vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#bf616a" })
			vim.fn.sign_define("smoothcursor", { text = "" })
		elseif current_mode == "i" then
			vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#668aab" })
			vim.fn.sign_define("smoothcursor", { text = "" })
		end
	end,
})

require("colorizer").setup()

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd.colorscheme("tokyonight")

require("toggleterm").setup({
	open_mapping = "<leader>tt", -- Set the open mapping to <leader>t
	start_in_insert = true,
	insert_mappings = false,
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

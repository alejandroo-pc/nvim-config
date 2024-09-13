return {
	{
		"navarasu/onedark.nvim",
		version = "*",
		config = function()
			require("onedark").setup({
				style = "cool",
			})
			vim.cmd.colorscheme("onedark")
		end,
	},
}

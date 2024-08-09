return {
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "cool",
			})
			vim.cmd.colorscheme("onedark")
		end,
	},
}

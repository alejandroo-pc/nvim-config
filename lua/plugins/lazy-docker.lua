return {
	"mgierada/lazydocker.nvim",
	dependencies = { "akinsho/toggleterm.nvim" },
	config = function()
		require("lazydocker").setup({
			border = "shadow", -- valid options are "single" | "double" | "shadow" | "curved"
		})
	end,
	event = "BufRead",
	keys = {
		{
			"<leader>D",
			function()
				require("lazydocker").open()
			end,
			desc = "Open Lazydocker floating window",
		},
	},
}

return {
	"NachoNievaG/atac.nvim",
	version = "*",
	lazy = true,
	dependencies = { "akinsho/toggleterm.nvim" },
	config = function()
		require("atac").setup({
			dir = "/Users/alejandro/workspace/atac/",
		})
	end,
}

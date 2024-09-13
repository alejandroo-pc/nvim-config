return {
	"NachoNievaG/atac.nvim",
	dependencies = { "akinsho/toggleterm.nvim" },
	config = function()
		require("atac").setup({
			dir = "/Users/alejandro/workspace/atac/",
		})
	end,
}

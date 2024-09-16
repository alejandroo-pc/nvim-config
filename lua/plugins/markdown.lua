return {
	"MeanderingProgrammer/render-markdown.nvim",
	version = "*",

	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	--dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins

	opts = {
		heading = {
			enabled = true,
			sign = false,
			width = "block",
			min_width = 40,
		},
	},
}

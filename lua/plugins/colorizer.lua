return {
	"norcalli/nvim-colorizer.lua",
	version = "*",
	lazy = true,
	config = function()
		require("colorizer").setup()
	end,
}

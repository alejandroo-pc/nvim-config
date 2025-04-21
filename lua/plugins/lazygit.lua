return {
	"folke/snacks.nvim",
	---@type snacks.Config
	---@class snacks.lazygit.Config: snacks.terminal.Opts
	---@field args? string[]
	---@field theme? snacks.lazygit.Theme
	opts = {
		lazygit = {
			configure = false,
			theme = {
				selectedLineBgColor = { bg = "default" }, -- set to `default` to have no background colour
			},
		},
	},
}

return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- We'd like this plugin to load first out of the rest
		config = true, -- This automatically runs `require("luarocks-nvim").setup()`
	},
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		lazy = false, -- specify lazy = false because some lazy.nvim distributions set lazy = true by default
		dependencies = { "luarocks.nvim" },
		version = "*",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					},
					["core.integrations.nvim-cmp"] = {},
					["core.ui.calendar"] = {},
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								work = "~/notes/work",
								home = "~/notes/home",
							},
							default_workspace = "work",
						},
					},
					["core.keybinds"] = {
						config = {
							neorg_leader = ",",
						},
					},
				},
			})
		end,
	},
}

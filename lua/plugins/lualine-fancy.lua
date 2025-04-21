return {
	{
		"nvim-lualine/lualine.nvim",
		version = "*",

		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"meuter/lualine-so-fancy.nvim",
		},
		opts = {
			options = {
				theme = "ayu_mirage",
				component_separators = { left = "│", right = "│" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
				refresh = {
					statusline = 100,
				},
			},
			sections = {
				lualine_a = {
					{ "fancy_mode", width = 3 },
				},
				lualine_b = {
					{ "fancy_branch" },
				},
				lualine_c = {
					{
						-- function()
						-- 	return require("auto-session.lib").current_session_name(true)
						-- end,
						--
						-- "fancy_cwd",
						-- substitute_home = true,
					},
				},
				lualine_x = {
					{ "fancy_diff" },
					{ "fancy_macro" },
					{ "fancy_diagnostics" },
					{ "fancy_searchcount" },
					{ "fancy_location" },
				},
				lualine_y = {
					{ "fancy_filetype", ts_icon = "" },
				},
				lualine_z = {},
			},
		},
	},
}

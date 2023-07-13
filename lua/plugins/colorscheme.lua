if true then
	return {}
end

-- never gets loaded delete line above
return {
	{ "sainnhe/everforest" },
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})
			vim.cmd("autocmd ColorScheme * highlight NotifyBackground guibg=#000000")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				style = "mocha", -- mocha, macchiato, frappe, latte
				term_colors = true,
				integrations = {
					nvimtree = true,
					cmp = true,
					gitsigns = true,
					telescope = true,
					treesitter = true,
				},
				transparent_background = false,
			})
			vim.cmd.colorscheme("catppuccin")
			local colors = require("catppuccin.palettes.mocha")
			vim.api.nvim_set_hl(0, "Tabline", { fg = colors.green, bg = colors.mantle })
			vim.api.nvim_set_hl(0, "TermCursor", { fg = "#A6E3A1", bg = "#A6E3A1" })
		end,
	},

	-- color html colors
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				css = { css_fn = true, css = true },
				"javascript",
				"html",
				"r",
				"rmd",
				"qmd",
				"markdown",
				"python",
			})
		end,
	},
}

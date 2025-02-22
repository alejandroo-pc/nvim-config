return {
	"pwntester/octo.nvim",
	cmd = "Octo",
	event = { { event = "BufReadCmd", pattern = "octo://*" } },
	opts = {
		enable_builtin = true,
		default_to_projects_v2 = true,
		default_merge_method = "squash",
		picker = "telescope",
	},

	keys = {
		{ "<leader>oi", "<cmd>Octo issue list<CR>", desc = "List Issues (Octo)" },
		{ "<leader>oI", "<cmd>Octo issue search<CR>", desc = "Search Issues (Octo)" },
		{ "<leader>op", "<cmd>Octo pr list<CR>", desc = "List PRs (Octo)" },
		{ "<leader>oP", "<cmd>Octo pr search<CR>", desc = "Search PRs (Octo)" },
		{ "<leader>or", "<cmd>Octo repo list<CR>", desc = "List Repos (Octo)" },
		{ "<leader>oS", "<cmd>Octo search<CR>", desc = "Search (Octo)" },

		{ "<leader>oR", "<cmd>Octo review start<CR>", desc = "Start PR Review (Octo)" },
		{ "<leader>oC", "<cmd>Octo pr checkout<CR>", desc = "Checkout to PR branch (Octo)" },
		{ "<leader>oL", "<cmd>Octo pr reload<CR>", desc = "Refresh PR (Octo)" },

		{ "<leader>a", "", desc = "+assignee (Octo)", ft = "octo" },
		{ "<leader>c", "", desc = "+comment/code (Octo)", ft = "octo" },
		{ "<leader>l", "", desc = "+label (Octo)", ft = "octo" },
		{ "<leader>i", "", desc = "+issue (Octo)", ft = "octo" },
		{ "<leader>r", "", desc = "+react (Octo)", ft = "octo" },
		{ "<leader>p", "", desc = "+pr (Octo)", ft = "octo" },
		{ "<leader>v", "", desc = "+review (Octo)", ft = "octo" },
		{ "@", "@<C-x><C-o>", mode = "i", ft = "octo", silent = true },
		{ "#", "#<C-x><C-o>", mode = "i", ft = "octo", silent = true },
	},
}

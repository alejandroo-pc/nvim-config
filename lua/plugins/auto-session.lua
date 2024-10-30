return {
	"rmagatti/auto-session",
	lazy = false,
	version = "*",

	dependencies = {
		"nvim-telescope/telescope.nvim",
	},

	keys = {
		{ "<leader>wS", "<cmd>SessionSearch<CR>", desc = "Session search" },
		{ "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save session for auto session root dir" },
		{ "<leader>wa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
		{ "<leader>wr", "<cmd>SessionRestore<CR>", desc = "Restore session for cwd" },
	},

	config = function()
		local auto_session = require("auto-session")
		auto_session.setup({
			auto_save_enabled = true,
			auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
			session_lens = {
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},
		})
	end,
}

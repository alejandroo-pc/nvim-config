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
    vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		auto_session.setup({
			auto_save = true,
			suppressed_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
			session_lens = {
				load_on_setup = true,
				previewer = false,
				theme_conf = {
					border = true,
				},
			},
		})
	end,
}

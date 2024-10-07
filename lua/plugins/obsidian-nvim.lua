return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = false,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	--
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},

	opts = {
		workspaces = {
			{
				name = "personal",
				path = "/Users/alejandro/Library/Mobile Documents/iCloud~md~obsidian/Documents/workshop",
			},
			{
				name = "work",
				path = "/Users/alejandro/Library/Mobile Documents/iCloud~md~obsidian/Documents/workshop/01_CTD",
			},
		},

		date_format = "%Y-%m-%d",
		notes_subdir = "01_CTD",
		new_notes_location = "notes_subdir",

		completion = {
			nvim_cmp = true,
			min_chars = 4,
		},

		templates = {
			folder = "templates",
			date_format = "%Y-%m-%d-%a",
			time_format = "%H:%M",
		},
		vim.opt.conceallevel == 1,
		ui = { enable = false },
	},
	keys = {
		{ "<leader>ns", "<cmd>ObsidianQuickSwitch<CR>", desc = "Obsidin Search Note" },
		{ "<leader>nN", "<cmd>ObsidinNew<CR>", desc = "Obsidian New Note" },
		{ "<leader>nT", "<cmd>ObsidianNewFromTemplate<CR>", desc = "Obsidian New Note Template" },
	},
}

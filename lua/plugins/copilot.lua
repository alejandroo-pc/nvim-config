return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	opts = {
		suggestion = { enabled = false },
		panel = { enabled = true, autorefresh = true },
		filetypes = {
			javascript = true,
			typescript = true,
			markdown = true,
			help = true,
		},
	},
}

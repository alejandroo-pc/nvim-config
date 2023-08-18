return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	opts = {
		suggestion = { enabled = true },
		panel = { enabled = false },
		filetypes = {
			javascript = true,
			markdown = true,
			help = true,
		},
	},
}

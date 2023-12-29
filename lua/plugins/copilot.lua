return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	opts = {
		suggestion = { enabled = true },
		panel = { enabled = true },
		filetypes = {
			javascript = true,
			typescript = true,
			markdown = true,
			help = true,
		},
	},
}

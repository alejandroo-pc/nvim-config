if true then
	return {}
end

return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	opts = {
		suggestion = { enabled = false },
		panel = { enabled = false },
		filetypes = {
			javascript = true,
			markdown = true,
			help = true,
		},
	},
}

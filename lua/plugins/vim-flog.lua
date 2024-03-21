return {
	"rbong/vim-flog",
	lazy = true,
	cmd = { "Flog", "Flogsplit", "Floggit" },
	dependencies = {
		"tpope/vim-fugitive",
	},
	config = function()
		local keymap = vim.keymap
		keymap.set("n", "<leader>xs", "<cmd>Flog<CR>", { desc = "Flog" })
		keymap.set("n", "<leader>gi", "<cmd>Flogsplit<CR>", { desc = "Flog Split" })
		keymap.set("n", "<leader>gg", "<cmd>Floggit<CR>", { desc = "Flog git" })
	end,
}

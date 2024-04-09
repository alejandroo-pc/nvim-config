return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	{
		"rest-nvim/rest.nvim",
		ft = "http",
		dependencies = { "luarocks.nvim" },
		config = function()
			require("rest-nvim").setup({
				result = {
					keybinds = {
						buffer_local = false,
						prev = ";",
						next = "'",
					},
				},
			})
			local keymap = vim.keymap
			keymap.set("n", "<leader>rr", "<cmd>Rest run<cr>", { desc = "Run request under the cursor" })
			keymap.set("n", "<leader>rl", "<cmd>Rest run last<cr>", { desc = "Re-run latest request" })
			keymap.set("n", "<leader>rr", "<cmd>Rest run<cr>", { desc = "Run request under the cursor" })
		end,
	},
}

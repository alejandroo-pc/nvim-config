return {
	"rest-nvim/rest.nvim",
	requires = { "nvim-lua/plenary.nvim" },
	commit = "8b62563",
	config = function()
		require("rest-nvim").setup({

			-- Open request results in a horizontal split
			result_split_horizontal = false,
			-- Keep the http file buffer above|left when split horizontal|vertical
			result_split_in_place = true,
			-- Skip SSL verification, useful for unknown certificates
			skip_ssl_verification = false,
			-- Encode URL before making request
			encode_url = true,
			-- Highlight request on run
			highlight = {
				enabled = true,
				timeout = 150,
			},

			result = {
				-- toggle showing URL, HTTP info, headers at top the of result window
				show_url = true,
				show_curl_command = false,
				show_http_info = true,
				show_headers = false,

				formatters = {
					json = function(body)
						return vim.fn.system({ "jq", "." }, body)
					end,
				},
			},

			-- Jump to request line on run
			jump_to_request = false,
			env_file = ".env",
			custom_dynamic_variables = {},
			yank_dry_run = true,
		})

		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("n", "<leader>rr", "<Plug>RestNvim", opts)
		vim.api.nvim_set_keymap("n", "<leader>rp", "<Plug>RestNvimPreview", opts)
		vim.api.nvim_set_keymap("n", "<leader>rl", "<Plug>RestNvimLast", opts)
	end,
}

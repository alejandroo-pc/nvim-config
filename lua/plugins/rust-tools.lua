-- Import the keymap functions from Neovim API
local api = vim.api
local keymap = api.nvim_set_keymap

-- Define keybindings for Rustaceanvim in Rust files
keymap("n", "<leader>ac", ":RustLsp codeAction<CR>", { silent = true, noremap = true })
keymap("n", "<leader>ah", ":RustLsp hover actions<CR>", { silent = true, noremap = true })

-- Return the configuration for Rustaceanvim
return {
	"mrcjkb/rustaceanvim",
	version = "^4", -- Recommended
	ft = { "rust" }, -- Set filetype for Rust files
	dap = {
		autoload_configurations = true, -- Autoload dap configurations
	},
}

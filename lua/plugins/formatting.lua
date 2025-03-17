local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		svelte = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		lua = { "stylua" },
		http = { "kulala-fmt" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	},
})

return {
	{
		"stevearc/conform.nvim",
		lazy = true,
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		-- Note: Avoid setting plugin.config directly for conform.nvim
	},
}

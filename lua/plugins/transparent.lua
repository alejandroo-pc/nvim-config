return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").setup({
			-- table: default groups
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLine",
				"CursorLineNr",
				"StatusLine",
				"StatusLineNC",
				"EndOfBuffer",
			},
			-- table: additional groups that should be cleared
			extra_groups = {
				"NormalFloat",
				"MasonNormal",
				"NvimTreeNormal",
				"NvimTreeNormalNC",
				"NvimTreeNormalFloat",
				"NvimTreeEndOfBuffer",
			}, -- table: groups you don't want to clear
			exclude_groups = {}, -- Corrected line: no extra '_groups'
			-- function: code to be executed after highlight groups are cleared
			-- Also the user event "TransparentClear" will be triggered
			on_clear = function() end,
		})

		-- These calls should happen AFTER setup, within the config function
		require("transparent").clear_prefix("BufferLine")
		require("transparent").clear_prefix("NeoTree")
	end,
}

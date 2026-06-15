vim.cmd("colorscheme evergarden")

local customColor = "#232A2E"
vim.api.nvim_set_hl(0, "WinSeparator", { fg = customColor })
vim.api.nvim_set_hl(0, "LspFloatWinBorder", { fg = customColor })
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = customColor })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = customColor })

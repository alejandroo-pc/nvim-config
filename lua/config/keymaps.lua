-- Import the required modules
local keymap = vim.keymap
keymap.set("n", "<leader>a", ":lua vim.lsp.buf.definition()<CR>")
keymap.set("n", "<leader>v", ":vsplit | lua vim.lsp.buf.definition()<CR>")

-- Exit insert mode with "jk"
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Delete without yanking to register
keymap.set("n", "x", '"_x') -- delete char without yank
keymap.set("x", "x", '"_x') -- delete visual selection without yank
keymap.set("n", "dd", '"_dd') -- delete line without yank
keymap.set("x", "dd", '"_dd') -- delete visual line without yank
keymap.set("x", "p", '"_dP') -- paste in visual mode without overwriting register

-- Vertical and Horizontal Resize keybindings
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })

-- Horizontal Movement with Control key
keymap.set("n", "<C-]>", ":vertical resize -3<CR>", { silent = true, desc = "Decrease window width" })
keymap.set("n", "<C-[>", ":vertical resize +3<CR>", { silent = true, desc = "Increase window width" })

-- Other window management keybindings
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })

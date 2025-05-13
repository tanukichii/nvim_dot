-- this file is for non plugin related keymaps
--
--
-- yank to clipboard
-- some information on yank buffers:
-- "+... is the windows clipboard buffer, and the nvim one is ""...
vim.keymap.set({ "n", "v" }, "y", [["+y]])

-- better movement between windows
-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- select previous after indenting
vim.keymap.set("v", "<", "<gv", { desc = "Keep selection after indenting" })
vim.keymap.set("v", ">", ">gv", { desc = "Keep selection after indenting" })

-- neo tree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>")

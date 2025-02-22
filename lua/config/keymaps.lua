-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { desc = "Tmux Navigate Left" })
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { desc = "Tmux Navigate Down" })
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { desc = "Tmux Navigate Up" })
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { desc = "Tmux Navigate Right" })
vim.keymap.set("n", "<C-b><C-b>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { desc = "Tmux Navigate Last Active Pane" })

-- custom keymaps
vim.keymap.set("v", "<leader>BE", ":<c-u>lua require('b64').encode()<cr>", { desc = "Base64 Encode" })
vim.keymap.set("v", "<leader>BD", ":<c-u>lua require('b64').decode()<cr>", { desc = "Base64 Decode" })
vim.keymap.set("n", "<leader>cj", "<cmd>%!jq .<cr>", { desc = "Run jq on current buffer" })
vim.keymap.set("n", "<leader>ct", "<cmd>retab<cr>", { desc = "Convert Tabs to Spaces" })

vim.keymap.set("i", "jk", "<Esc>")

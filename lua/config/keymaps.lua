-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { desc = "Tmux Navigate Left" })
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { desc = "Tmux Navigate Down" })
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { desc = "Tmux Navigate Up" })
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { desc = "Tmux Navigate Right" })
vim.keymap.set("n", "<C-b><C-b>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { desc = "Tmux Navigate Last Active Pane" })

vim.keymap.set("n", "<leader>uf", require("lazyvim.util.format").toggle, { desc = "Toggle format on Save" })
vim.keymap.set("n", "<leader>uL", function()
  require("lazyvim.util").toggle("relativenumber", true)
  require("lazyvim.util").toggle("number")
end, { desc = "Toggle Line Numbers" })
vim.keymap.set("n", "<leader>ul", function()
  require("lazyvim.util").toggle("relativenumber")
end, { desc = "Toggle Relative Line Numbers" })

-- 
-- custom keymaps
vim.keymap.set("v", "<leader>BE", ":<c-u>lua require('b64').encode()<cr>", { desc = "Base64 Encode" })
vim.keymap.set("v", "<leader>BD", ":<c-u>lua require('b64').decode()<cr>", { desc = "Base64 Decode" })
vim.keymap.set("n", "<leader>cj", "<cmd>%!jq .<cr>", { desc = "Run jq on current buffer" })
vim.keymap.set("n", "<leader>ct", "<cmd>retab<cr>", { desc = "Convert Tabs to Spaces" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set({"n", "v"}, "y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>K", "<cmd>lnext<CR>zz", { desc = "Next Location" })
vim.keymap.set("n", "<leader>J", "<cmd>lprev<CR>zz", { desc = "Previous Location" })

vim.keymap.set("n", "J", "mzJ`z")

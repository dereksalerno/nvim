-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false
vim.g.python_recommended_style = 0

vim.opt.conceallevel = 0
vim.opt.wrap = true -- Disable line wrap
vim.opt.foldopen = "all"
vim.opt.foldlevel = 40
vim.opt.background = "dark"
vim.opt.ignorecase = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

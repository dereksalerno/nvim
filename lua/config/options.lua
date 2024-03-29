-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local function copy(lines, _)
  require("osc52").copy(table.concat(lines, "\n"))
end

local function paste()
  return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
end

vim.g.clipboard = {
  name = "osc52",
  copy = { ["+"] = copy, ["*"] = copy },
  paste = { ["+"] = paste, ["*"] = paste },
}


-- local function copy()
--   if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
--     require('osc52').copy_register('+')
--   end
-- end

-- vim.api.nvim_create_autocmd('TextYankPost', {callback = copy})
-- local function copy(lines, _)
--   require("osc52").copy(table.concat(lines, "\n"))
-- end

vim.g.autoformat = false

vim.opt.conceallevel = 0
vim.opt.wrap = true -- Disable line wrap
vim.opt.foldopen = "all"
vim.opt.foldlevel = 40
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

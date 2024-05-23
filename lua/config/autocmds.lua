-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
local augroup = vim.api.nvim_create_augroup("copilot-disable-patterns", { clear = true })
local disable_dirs = {
    vim.fn.expand "/root" .. "/*",
}
for _, pattern in ipairs(disable_dirs) do
    vim.api.nvim_create_autocmd("LspAttach", {
        group = augroup,
        pattern = "*", -- This pattern will match all files, including new buffers
        callback = function(args)
            -- Check if the buffer has a name (file associated) or if CWD starts with /home/user/Documents
            local bufname = vim.api.nvim_buf_get_name(0)
            local cwd = vim.fn.getcwd()

            if bufname == "" and cwd:match("^" .. pattern) or bufname:match(pattern) then
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client.name == "copilot" then
                    vim.defer_fn(function()
                        vim.cmd "silent Copilot detach"
                    end, 0)
                end
            end
        end,
    })
end
vim.api.nvim_create_autocmd({
  "BufNewFile",
  "BufRead",
}, {
  pattern = "*.yml",
  callback = function()
    vim.cmd("set ft=yaml.ansible")
  end,
})
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--     pattern = {"*"},
--     callback = function()
--       local save_cursor = vim.fn.getpos(".")
--       pcall(function() vim.cmd [[%s/\s\+$//e]] end)
--       vim.fn.setpos(".", save_cursor)
--     end,
-- })

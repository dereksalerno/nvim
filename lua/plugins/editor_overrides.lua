local function toggle_diffview(cmd)
  if next(require("diffview.lib").views) == nil then
    vim.cmd(cmd)
  else
    vim.cmd("DiffviewClose")
  end
end
return {
  {
    "sindrets/diffview.nvim",
    command = "DiffviewOpen",
    cond = is_git_root,
    keys = {
      {
        "<leader>gd",
        function()
          toggle_diffview("DiffviewOpen")
        end,
        desc = "Diff Index",
      },
      {
        "<leader>gD",
        function()
          toggle_diffview("DiffviewOpen develop..HEAD")
        end,
        desc = "Diff master",
      },
      {
        "<leader>gf",
        function()
          toggle_diffview("DiffviewFileHistory %")
        end,
        desc = "Open diffs for current File",
      },
    },
    version = "*",
    event = "VeryLazy",
    config = function()
      require("diffview").setup({})
    end,
  },
  {
    "WolfeCub/harpeek.nvim",
    config = function()
      require("harpeek").setup()
    end,
  },
  {
    "mistweaverco/kulala.nvim",
    opts = {
      additional_curl_options = { "--insecure" },
      ui = {
        display_mode = "float",
        show_request_summary = true,
        winbar = true,
        default_winbar_panes = { "body", "headers", "headers_body", "verbose", "script_output", "stats" },
      },
    },
  },
}

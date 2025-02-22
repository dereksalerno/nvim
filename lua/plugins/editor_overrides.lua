return {
  {
    "sindrets/diffview.nvim",
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
        show_request_summary = false,
        winbar = true,
        default_winbar_panes = { "body", "headers", "headers_body", "verbose" },
      },
    },
  },
}

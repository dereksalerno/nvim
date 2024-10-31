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
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "ibhagwan/fzf-lua", -- optional
    },
    config = true,
    keys = {
      { "<leader>uB", require("gitsigns").toggle_current_line_blame, desc = "  Toggle Git Blame" },
    },
  },
  {
    "WolfeCub/harpeek.nvim",
    config = function()
      require("harpeek").setup()
    end,
  },
}

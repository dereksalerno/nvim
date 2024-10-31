return {
  { "kkharji/sqlite.lua", enabled = not jit.os:find("Windows") },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = true },
      filetypes = {
        yaml = true,
        markdown = true,
        help = true,
      },
    },
  },
  { "nvim-neotest/nvim-nio" },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "towolf/vim-helm" },

  { "taybart/b64.nvim" },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-ci" },
        },
      },
    },
  },
  -- auto pairs
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },
}

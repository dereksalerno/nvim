return {
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        override = {
          ["cmp.entry.get_documentation"] = true,
        },
      },
    },
    keys = false,
  },
  {
  "folke/which-key.nvim",
  optional = true,
  opts = {
    defaults = {
      ["<leader>d"] = { name = "+debug" },
      ["<leader>da"] = { name = "+adapters" },
    },
  },
},
}

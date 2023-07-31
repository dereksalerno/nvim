return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.shfmt.with({ extra_args = { "-i", "2" } }))
    end,
  },
}

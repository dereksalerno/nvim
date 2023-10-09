return {
  "sanathks/workspace.nvim",
  dependencies = {"nvim-telescope/telescope.nvim"},
  config = function()
    require("workspace").setup({
      workspaces = {
        { name = "bin", path = "~/bin", keymap = { "<leader>tp" } },
        { name = "neovim", path = "~/.config/nvim", keymap = { "<leader>nc" } },
      }
    })
  end,
}

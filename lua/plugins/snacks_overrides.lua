return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      input = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      terminal = { enabled = true },
      picker = {
        explorer = {
        enabled = true,
        position = "left",
        width = 30,
        height = 0.9,
        backdrop = 60,
        zindex = 50,
        preview = "main",
        },
      },
      styles = {
        terminal = {
          position = "float",
          backdrop = 60,
          height = 0.9,
          width = 0.9,
          zindex = 50,
        },
      },
    },
  },
}

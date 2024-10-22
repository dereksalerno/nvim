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
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
        end,
        desc = "harpoon file",
      },
      {
        "<leader>ht",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon quick menu",
      },
      {
        "<leader>hs",
        function()
          require("harpeek").toggle()
        end,
        desc = "harpeek toggle",
      },
      {
        "<leader>1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "harpoon to file 1",
      },
      {
        "<leader>2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "harpoon to file 2",
      },
      {
        "<leader>3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "harpoon to file 3",
      },
      {
        "<leader>4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "harpoon to file 4",
      },
      {
        "<leader>5",
        function()
          require("harpoon"):list():select(5)
        end,
        desc = "harpoon to file 5",
      },
    },
  },
  {
    "WolfeCub/harpeek.nvim",
    config = function()
      require("harpeek").setup()
    end,
  },
  {
    "f-person/git-blame.nvim",
    keys = {
      {
        "<leader>gb",
        function()
          vim.cmd("GitBlameToggle")
        end,
        desc = "Toggle Git Blame",
      },
    },
    opts = {
      enabled = true, -- if you want to enable the plugin
      message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
      date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
      virtual_text_column = 1,
    },
  },
  { "tpope/vim-fugitive" },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    -- vscode = false,
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("git-conflict").setup({
        default_mappings = true,
        default_commands = true, -- disable commands created by this plugin
        disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
        list_opener = "copen",
        highlights = { -- They must have background color, otherwise the default color will be used
          incoming = "DiffText",
          current = "DiffAdd",
        },
      })
    end,
  },
}

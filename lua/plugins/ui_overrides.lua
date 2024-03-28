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
  },
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
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
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "abeldekat/harpoonline" },
    config = function()
      local git_blame = require("gitblame")
      local Harpoonline = require("harpoonline") -- using default config
      Harpoonline.setup({
        on_update = function()
          require("lualine").refresh()
        end,
      })
      local lualine_c = { Harpoonline.format, "filename" }

      require("lualine").setup({
        options = {
          disabled_filetypes = {
            winbar = { "neo-tree", "alpha" },
            statusline = {},
          },
        },

        sections = {
          lualine_c = lualine_c,
          lualine_x = { { require("auto-session.lib").current_session_name } },
        },

        winbar = {
          lualine_a = {
            {
              "filename",
              file_status = true,
              newfile_status = true,
              path = 1,
              symbols = {
                modified = "[+]",
                readonly = "[-]",
                unnamed = "[No Name]",
                newfile = "[New]",
              },
            },
          },
          lualine_b = {},
          lualine_c = {
            {
              "filetype",
              colored = true,
              icon_only = true,
              icon = { align = "left" },
            },
          },
          lualine_x = { { require("auto-session.lib").current_session_name } },
          lualine_y = {},
          lualine_z = {
            {
              "buffers",
              show_modified_status = true,
              use_mode_colors = true,
              symbols = {
                modified = " ●",
                alternate_file = "",
                directory = "",
              },
            },
          },
        },

        inactive_winbar = {
          lualine_a = {
            {
              "filename",
              file_status = true,
              newfile_status = true,
              path = 1,
              symbols = {
                modified = "[+]",
                readonly = "[-]",
                unnamed = "[No Name]",
                newfile = "[New]",
              },
            },
          },
          lualine_b = {
            {
              "filetype",
              colored = true,
              icon_only = true,
              icon = { align = "left" },
            },
          },
          lualine_c = {},
          lualine_x = { { require("auto-session.lib").current_session_name } },
          lualine_y = {
            {
              "buffers",
              show_modified_status = true,
              use_mode_colors = true,
              symbols = {
                modified = " ●",
                alternate_file = "",
                directory = "",
              },
            },
          },
          lualine_z = {},
        },
      })
    end,
  },
}

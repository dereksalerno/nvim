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
    "folke/which-key.nvim",
    defaults = {},
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>d", group = "debug" },
        { "<leader>da", group = "adapters" },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "abeldekat/harpoonline" },
    config = function()
      local Harpoonline = require("harpoonline") -- using default config
      Harpoonline.setup({
        on_update = function()
          require("lualine").refresh()
        end,
      })
      local lualine_c = { Harpoonline.format, "filename" }

      require("lualine").setup({
        options = {
          -- theme = require("neofusion.lualine"),
          theme = "tokyonight",
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
  { "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = {},
      },
      filesystem = {
        bind_to_cwd = false,
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        window = {
          mappings = {
            ["<C-o>"] = "open_nofocus",
          },
        },
        commands = {
          open_nofocus = function(state)
            require("neo-tree.sources.filesystem.commands").open(state)
            vim.schedule(function()
              vim.cmd([[Neotree focus]])
            end)
          end,
        },
      },
      window = {
        mappings = {
          ["<cr>"] = "open",
          ["h"] = "close_node",
        },
      },
    },
    keys = {
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.fn.expand("%:p:h") })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
    },
  },
}

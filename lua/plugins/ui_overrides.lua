return {
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "abeldekat/harpoonline" },
    config = function()
      local Harpoonline = require("harpoonline") -- using default config
      Harpoonline.setup({
        default_list_name = "",
        icon = "󰛢",
        formatter = "default",
        formatter_opts = {
          default = {
            inactive = " %s ", -- including spaces
            active = "[%s]",
            -- Max number of slots to display:
            max_slots = 4, -- Suggestion: as many as there are "select" keybindings
            -- The number of items in the harpoon list exceeds max_slots:
            more = "…", -- horizontal elipsis. Disable using empty string
          },
          short = {
            inner_separator = "|",
          },
        },
        ---@type HarpoonlineFormatter
        custom_formatter = nil,
        on_update = function()
          require("lualine").refresh()
        end,
      })
      local lualine_c = { Harpoonline.format, "filename" }

      require("lualine").setup({
        options = {
          theme = "tokyonight",
          disabled_filetypes = {
            winbar = { "neo-tree", "alpha" },
            statusline = {},
          },
        },

        sections = {
          lualine_c = lualine_c,
          lualine_x = { {} },
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
          lualine_x = { {} },
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
          lualine_x = { {} },
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

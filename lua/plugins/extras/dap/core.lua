return {
  "mfussenegger/nvim-dap",

  dependencies = {

    -- fancy UI for the debugger
    {
      "rcarriga/nvim-dap-ui",
      -- stylua: ignore
      keys = {
        { "<leader>Du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
        { "<leader>De", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
      },
      opts = {},
      config = function(_, opts)
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup(opts)
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open({})
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close({})
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close({})
        end
      end,
    },

    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },

    -- which key integration
    {
      "folke/which-key.nvim",
      opts = {
        defaults = {
          ["<leader>D"] = { name = "+Debug" },
          ["<leader>Da"] = { name = "+adapters" },
        },
      },
    },

    -- mason.nvim integration
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = "mason.nvim",
      cmd = { "DapInstall", "DapUninstall" },
      opts = {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_setup = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},

        -- You'll need to check that you have the required things installed
  
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
        },
      },
    },
  },

  -- stylua: ignore
  keys = {
    { "<leader>DB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>Db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>Dc", function() require("dap").continue() end, desc = "Continue" },
    { "<leader>DC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>Dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
    { "<leader>Di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>Dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>Dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>Dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>Do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>DO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>Dp", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>Dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>Ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>Dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>Dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },

  config = function()
    local Config = require("lazyvim.config")
    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    for name, sign in pairs(Config.icons.dap) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end
  end,
}

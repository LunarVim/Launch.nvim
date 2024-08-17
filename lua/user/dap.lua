local M = {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
}

-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-codelldb
function M.config()
  local dap = require("dap")

  dap.adapters.lldb = {
    type = "server",
    port = "${port}",
    executable = {
      command = vim.fn.getenv("HOME") .. "/.local/share/nvim/mason/bin/codelldb",
      args = { "--port", "${port}" },
    },
  }

  local lldb = {
    name = "Launch",
    type = "lldb", -- matches the adapter
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  }

  dap.configurations = {
    cpp = { lldb },
    c = { lldb },
    rust = { lldb },
  }

  local wk = require("which-key")
  wk.add {
    { "<F5>", "<cmd>lua require 'dap'.continue()<cr>", desc = "Continue" },
    { "<F9>", "<cmd>lua require 'dap'.toggle_breakpoint()<cr>", desc = "Toggle breakpoint" },
    { "<S-F9>", "<cmd>lua require 'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", desc = "Set logpoint" },
    { "<F10>", "<cmd>lua require 'dap'.step_over()<cr>", desc = "Step over" },
    { "<F11>", "<cmd>lua require 'dap'.step_into()<cr>", desc = "Step into" },
    { "<leader>du", "<cmd>lua require 'dap'.step_out()<cr>", desc = "Step out" },
    { "<leader>dr", "<cmd>lua require 'dap'.repl.open()<cr>", desc = "Open REPL" },
    { "<leader>dh", "<cmd>lua require 'dap.ui.widgets'.hover()<cr>", desc = "Open hover" },
    { "<leader>dp", "<cmd>lua require 'dap.ui.widgets'.preview()<cr>", desc = "Open preview" },
    { "<leader>df", "<cmd>lua local widgets = require 'dap.ui.widgets'; widgets.centered_float(widgets.scopes)<cr>", desc = "Open float" },
    { "<leader>ds", "<cmd>lua local widgets = require 'dap.ui.widgets'; widgets.sidebar(widgets.scopes)<cr>", desc = "Open side bar" },
  }

  vim.fn.sign_define("DapBreakpoint", { text='🛑', texthl='', linehl='', numhl='' })
  vim.fn.sign_define("DapStopped", { text='🧩', texthl='', linehl='', numhl='' })
  vim.fn.sign_define("DapBreakpointRejected", { text='🔥', texthl='', linehl='', numhl='' })
  vim.fn.sign_define("DapLogPoint", { text='📄', texthl='', linehl='', numhl='' })
end

return M

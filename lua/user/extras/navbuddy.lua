local M = {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    {
      "SmiteshP/nvim-navic",
      commit = "e6da6f74d89de65258ea7e98e22103ff5de6dcf5",
    },
    "MunifTanjim/nui.nvim",
  },
}

function M.config()
  local navbuddy = require "nvim-navbuddy"
  -- local actions = require("nvim-navbuddy.actions")
  navbuddy.setup {
    window = {
      border = "rounded",
    },
    icons = require("user.icons").kind,
    lsp = { auto_attach = true },
  }

  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap

  keymap("n", "<m-s>", ":silent only | Navbuddy<cr>", opts)
  keymap("n", "<m-o>", ":silent only | Navbuddy<cr>", opts)
end

return M

local M = {
  "linrongbin16/gitlinker.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  event = "VeryLazy",
}

function M.config()
  require("gitlinker").setup {
    -- print message in command line
    message = true,

    -- key mapping
    mapping = {
      ["<leader>gY"] = {
        -- copy git link to clipboard
        action = require("gitlinker.actions").clipboard,
        desc = "Copy git link to clipboard",
      },
      ["<leader>gy"] = {
        -- open git link in browser
        action = require("gitlinker.actions").system,
        desc = "Open git link in browser",
      },
    },

    -- write logs to console(command line)
    console_log = true,
  }
end

return M

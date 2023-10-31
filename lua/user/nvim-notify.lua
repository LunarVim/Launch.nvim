local M = {
 'rcarriga/nvim-notify',
  event = "VeryLazy",
}

function M.config()
  vim.notify = require("notify")
  require('notify').setup({
    -- Animation style (see below for details)
    stages = "fade_in_slide_out",
    -- Default timeout for notifications
    timeout = 5000,
    -- For stages that change opacity this is treated as the highlight behind the window
    background_colour = "#000000",
    max_width = 80,
    max_height = 80,
    -- Icons for the different levels
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
    },
  })
end

return M

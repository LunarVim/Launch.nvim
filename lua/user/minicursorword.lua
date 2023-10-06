local M = {
  "echasnovski/mini.cursorword",
  event = "VeryLazy",
}

function M.config()
  local cursorword = require "mini.cursorword"
  cursorword.setup()
end

return M

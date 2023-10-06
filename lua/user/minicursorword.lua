local M = {
  "echasnovski/mini.cursorword",
  event = "VeryLazy",
}

function M.config()
  local cursorword = require "mini.curword"
  cursorword.setup()
end

return M

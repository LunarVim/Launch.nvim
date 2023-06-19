local M = {
  "zbirenbaum/copilot.lua",
  event = "VeryLazy",
}

function M.config()
  require("copilot").setup {}
end


return M

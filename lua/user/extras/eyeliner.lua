local M = {
  "jinh0/eyeliner.nvim",
  event = "VeryLazy",
}

function M.config()
  require("eyeliner").setup {
    highlight_on_key = true,
  }
end

return M

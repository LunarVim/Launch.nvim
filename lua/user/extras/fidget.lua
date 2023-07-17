local M = {
  "j-hui/fidget.nvim",
  branch = "legacy",
}

function M.config()
  require("fidget").setup {}
end

return M

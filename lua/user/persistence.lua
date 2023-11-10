local M = {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = { options = vim.opt.sessionoptions:get() },
  -- stylua: ignore
}

return M

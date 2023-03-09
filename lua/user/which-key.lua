local M = {
  "folke/which-key.nvim",
  commit = "5224c261825263f46f6771f1b644cae33cd06995",
  event = "VeryLazy",
}

function M.config()
  vim.o.timeout = true
  vim.o.timeoutlen = 300
  require("which-key").setup {}
end

return M

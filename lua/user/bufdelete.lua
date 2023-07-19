local M = {
  "famiu/bufdelete.nvim",
  event = "VeryLazy",
}

function M.config()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }
  keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
end

return M

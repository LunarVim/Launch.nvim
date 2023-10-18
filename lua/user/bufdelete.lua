local M = {
  "famiu/bufdelete.nvim",
  event = "VeryLazy",
  commit = "07d1f8ba79dec59d42b975a4df1c732b2e4e37b4",
}

function M.config()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }
  -- keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
  keymap("n", "Q", ":lua require('bufdelete').bufdelete(0, false)<cr>", opts)
end

return M

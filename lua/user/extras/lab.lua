local M = {
  "0x100101/lab.nvim",
  build = "cd js && npm ci",
}

function M.config()
  require("lab").setup {
    code_runner = {
      enabled = true,
    },
    quick_data = {
      enabled = false,
    },
  }

  -- local opts = { noremap = true, silent = true }
  --
  -- local keymap = vim.api.nvim_set_keymap
  --
  -- keymap("n", "<m-4>", ":Lab code run<cr>", opts)
  -- keymap("n", "<m-5>", ":Lab code stop<cr>", opts)
  -- keymap("n", "<m-6>", ":Lab code panel<cr>", opts)
end

return M

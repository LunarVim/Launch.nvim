local M = {
  "prichrd/netrw.nvim",
  event = "VeryLazy",
  commit = "596435bd2f5b0162b86c97ca8244e2b0862d3a4a",
}

function M.config()
  require("netrw").setup {
    icons = {
      symlink = " ",
      directory = " ",
      file = " ",
    },
    use_devicons = true,
    mappings = {},
  }
end

return M

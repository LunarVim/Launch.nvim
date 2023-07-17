local M = {
  "prichrd/netrw.nvim",
  event = "VeryLazy",
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

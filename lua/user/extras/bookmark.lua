local M = {
  -- url = "git@github.com:ChristianChiarulli/bookmark.nvim.git",
  "ChristianChiarulli/bookmark.nvim",
  event = "VeryLazy",
  dependencies = {
    "kkharji/sqlite.lua",
  },
}

function M.config()
  require("bookmark").setup {
    sign = "",
    highlight = "Constant",
  }

  require("telescope").load_extension "bookmark"
end

return M

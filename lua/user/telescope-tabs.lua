local M = {
  "LukasPietzschmann/telescope-tabs",
  event = "VeryLazy",
}

function M.config()
  require("telescope-tabs").setup {
    show_preview = false,
    close_tab_shortcut_i = "<C-d>", -- if you're in insert mode
    close_tab_shortcut_n = "dd", -- if you're in normal mode
  }
end

return M

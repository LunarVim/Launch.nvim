local M = {
  "andymass/vim-matchup",
  commit = "55e3330436784fb8ccc35a5cfeb13e48bab9dcd2",
  event = "CursorMoved",
  config = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
}

return M

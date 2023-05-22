local M = {
  "lewis6991/gitsigns.nvim",
  commit = "ec4742a7eebf68bec663041d359b95637242b5c3",
  event = "BufReadPre",
}

M.opts = {
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "󰐊", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "󰐊", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
}

return M

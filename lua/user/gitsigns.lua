local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  cmd = "Gitsigns",
}
M.config = function()
  local icons = require "user.icons"

  local wk = require "which-key"
  wk.add {
    { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", desc = "Next Hunk" },
    { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", desc = "Prev Hunk" },
    { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
    { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
    { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
    { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
    { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
    { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff" },
  }

  require("gitsigns").setup {
    signs = {

      -- Pretty sure these are defined in the theme.
      add = {
        -- current_line_blame_formatter
        -- hl = "GitSignsAdd",
        text = icons.ui.BoldLineMiddle,
        -- numhl = "GitSignsAddNr",
        -- linehl = "GitSignsAddLn",
      },
      change = {
        -- hl = "GitSignsChange",
        text = icons.ui.BoldLineDashedMiddle,
        -- numhl = "GitSignsChangeNr",
        -- linehl = "GitSignsChangeLn",
      },
      delete = {
        -- hl = "GitSignsDelete",
        text = icons.ui.TriangleShortArrowRight,
        -- numhl = "GitSignsDeleteNr",
        -- linehl = "GitSignsDeleteLn",
      },
      topdelete = {
        -- hl = "GitSignsDelete",
        text = icons.ui.TriangleShortArrowRight,
        -- numhl = "GitSignsDeleteNr",
        -- linehl = "GitSignsDeleteLn",
      },
      changedelete = {
        -- hl = "GitSignsChange",
        text = icons.ui.BoldLineMiddle,
        -- numhl = "GitSignsChangeNr",
        -- linehl = "GitSignsChangeLn",
      },
    },
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    update_debounce = 200,
    max_file_length = 40000,
    preview_config = {
      border = "rounded",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
  }
end

return M

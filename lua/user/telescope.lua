local M = {
  "nvim-telescope/telescope.nvim",
  commit = "40c31fdde93bcd85aeb3447bb3e2a3208395a868",
  event = "Bufenter",
  cmd = { "Telescope" },
  dependencies = {
    {
      "ahmedkhalf/project.nvim",
    },
  },
}

local actions = require "telescope.actions"

M.opts = {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },
    mappings = {
      i = {
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
}

return M

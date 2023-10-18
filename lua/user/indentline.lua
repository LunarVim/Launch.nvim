local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  commit = "9637670896b68805430e2f72cf5d16be5b97a22a",
}

function M.config()
  local icons = require "user.icons"

  require("indent_blankline").setup {
    buftype_exclude = { "terminal", "nofile" },
    filetype_exclude = {
      "help",
      "startify",
      "dashboard",
      "lazy",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "text",
    },
    -- char = icons.ui.LineLeft,
    char = icons.ui.LineMiddle,
    -- context_char = icons.ui.LineLeft,
    context_char = icons.ui.LineMiddle,
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    use_treesitter = true,
    show_current_context = true,
  }

  -- indent = { char = icons.ui.LineMiddle },
  -- whitespace = {
  --   remove_blankline_trail = true,
  -- },
  --
  -- exclude = {
  --   filetypes = {
  --     "help",
  --     "startify",
  --     "dashboard",
  --     "lazy",
  --     "neogitstatus",
  --     "NvimTree",
  --     "Trouble",
  --     "text",
  --   },
  --   buftypes = { "terminal", "nofile" },
  -- },
  -- scope = { enabled = false },
end

return M

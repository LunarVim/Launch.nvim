local M = {
  "echasnovski/mini.files",
  event = "VeryLazy",
}

function M.config()
  require("mini.files").setup {
    -- Customization of shown content
    content = {
      -- Predicate for which file system entries to show
      filter = nil,
      -- What prefix to show to the left of file system entry
      prefix = nil,
      -- In which order to show file system entries
      sort = nil,
    },

    -- Module mappings created only inside explorer.
    -- Use `''` (empty string) to not create one.
    mappings = {
      close = "q",
      go_in = "L",
      go_in_plus = "l",
      go_out = "h",
      go_out_plus = "H",
      reset = "<BS>",
      reveal_cwd = "@",
      show_help = "g?",
      synchronize = "=",
      trim_left = "<",
      trim_right = ">",
    },

    -- General options
    options = {
      -- Whether to delete permanently or move into module-specific trash
      permanent_delete = true,
      -- Whether to use for editing directories
      use_as_default_explorer = true,
    },

    -- Customization of explorer windows
    windows = {
      -- Maximum number of windows to show side by side
      max_number = math.huge,
      -- Whether to show preview of file/directory under cursor
      preview = true,
      -- Width of focused window
      width_focus = 50,
      -- Width of non-focused window
      width_nofocus = 15,
      -- Width of preview window
      width_preview = 50,
    },
  }

  vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesWindowOpen",
    callback = function(args)
      local win_id = args.data.win_id
      vim.api.nvim_win_set_config(win_id, { border = "rounded" })
    end,
  })

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }
  keymap("n", "-", ":lua MiniFiles.open()<cr>", opts)
end

return M

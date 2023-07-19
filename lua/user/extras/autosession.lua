local M = {
  "rmagatti/auto-session",
}

function M.config()
  vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
  -- local opts = {
  --   auto_session_enabled = true,
  --   auto_save_enabled = nil,
  --   auto_restore_enabled = nil,
  --   auto_session_suppress_dirs = {
  --     -- vim.fn.glob(vim.fn.stdpath "config" .. "/*"),
  --     os.getenv "HOME",
  --     -- os.getenv "HOME" .. "/Machfiles",
  --   },
  --   auto_session_use_git_branch = nil,
  --   -- the configs below are lua only
  --   bypass_session_save_file_types = { "alpha" },
  -- }
  --
  -- vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
  --
  -- -- telescope.load_extension "session-lens"
  --
  -- session_lens.setup {
  --   path_display = { "shorten" },
  --   -- theme_conf = { border = false },
  --   previewer = false,
  --   prompt_title = "Sessions",
  -- }
  --
  -- auto_session.setup(opts)
  require("auto-session").setup {
    log_level = vim.log.levels.ERROR,
    auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
    auto_session_use_git_branch = false,
    auto_session_root_dir = vim.fn.stdpath "data" .. "/sessions/",
    auto_session_enable_last_session = false,
    bypass_session_save_file_types = { "alpha" },

    -- ⚠️ This will only work if Telescope.nvim is installed
    -- The following are already the default values, no need to provide them if these are already the settings you want.
    session_lens = {
      -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
      load_on_setup = true,
      theme_conf = { border = true },
      previewer = false,
    },
  }

  -- Set mapping for searching a session.
  -- ⚠️ This will only work if Telescope.nvim is installed
  vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
    noremap = true,
  })
end

return M

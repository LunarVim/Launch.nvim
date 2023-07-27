local M = {
  "leoluz/nvim-dap-go",
  -- commit = "7e5602dd51a230581f43c42559d7acc2fbca23cf",
  -- event = {"CmdlineEnter"},
  ft = {"go", 'gomod'},
  -- build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  -- dependencies = {  -- optional packages
  --   {
  --     "ray-x/guihua.lua",
  --     commit = "9a15128d92dfba57ada2857316073d1fa3d97c93"
  --   },
  --   {
  --     "nvim-treesitter/nvim-treesitter",
  --     commit = "226c1475a46a2ef6d840af9caa0117a439465500",
  --     event = "VeryLazy",
  --   },
  --   {
  --     "neovim/nvim-lspconfig",
  --     commit = "649137cbc53a044bffde36294ce3160cb18f32c7",
  --   }
  -- },
}

function M.config()
  require('dap-go').setup {
    -- Additional dap configurations can be added.
    -- dap_configurations accepts a list of tables where each entry
    -- represents a dap configuration. For more details do:
    -- :help dap-configuration
    dap_configurations = {
      {
        -- Must be "go" or it will be ignored by the plugin
        type = "go",
        name = "Attach remote",
        mode = "remote",
        request = "attach",
      },
    },
    -- delve configurations
    delve = {
      -- the path to the executable dlv which will be used for debugging.
      -- by default, this is the "dlv" executable on your PATH.
      path = "dlv",
      -- time to wait for delve to initialize the debug session.
      -- default to 20 seconds
      initialize_timeout_sec = 20,
      -- a string that defines the port to start delve debugger.
      -- default to string "${port}" which instructs nvim-dap
      -- to start the process in a random available port
      port = "${port}",
      -- additional args to pass to dlv
      args = {},
      -- the build flags that are passed to delve.
      -- defaults to empty string, but can be used to provide flags
      -- such as "-tags=unit" to make sure the test suite is
      -- compiled during debugging, for example.
      -- passing build flags using args is ineffective, as those are
      -- ignored by delve in dap mode.
      build_flags = "",
    },
  }
end

return M


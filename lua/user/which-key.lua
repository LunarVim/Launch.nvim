local M = {
  "folke/which-key.nvim",
  commit = "5224c261825263f46f6771f1b644cae33cd06995",
  event = "VeryLazy",
  opts = {
    icons = {
      group = "", -- symbol prepended to a group
    },
  }
}

function M.config(_, opts)
  require("which-key").setup(opts)
  require("utils.keymaps-helpers").which_key_register()
end

return M

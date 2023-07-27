local M = {
  "ray-x/go.nvim",
  commit = "7e5602dd51a230581f43c42559d7acc2fbca23cf",
  event = {"CmdlineEnter"},
  ft = {"go", 'gomod'},
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  dependencies = {  -- optional packages
    {
      "ray-x/guihua.lua",
      commit = "9a15128d92dfba57ada2857316073d1fa3d97c93"
    },
    {
      "nvim-treesitter/nvim-treesitter",
      commit = "226c1475a46a2ef6d840af9caa0117a439465500",
      event = "VeryLazy",
    },
    {
      "neovim/nvim-lspconfig",
      commit = "649137cbc53a044bffde36294ce3160cb18f32c7",
    }
  },
}

function M.config()
 require("go").setup({})
end

return M

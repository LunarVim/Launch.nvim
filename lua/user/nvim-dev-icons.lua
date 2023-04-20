local M = {
  "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  commit = "0568104bf8d0c3ab16395433fcc5c1638efc25d4"
}

function M.config()
  require("nvim-web-devicons").setup {
    override = {
      zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh",
      },
    },
    color_icons = true,
    default = true,
  }
end

return M

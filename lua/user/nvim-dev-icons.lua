local M = {
  "kyazdani42/nvim-web-devicons",
  event = "VeryLazy",
  commit = "95b1e300699be8eb6b5be1758a9d4d69fe93cc7f"
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

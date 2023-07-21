local M = {
  "SmiteshP/nvim-navic",
  commit = "6e8850a524307814decc1b195a2c8a51482a9886"
}

function M.config()
  local icons = require "user.icons"
  require("nvim-navic").setup {
    icons = icons.kind,
    highlight = true,
    lsp = {
      auto_attach = true,
    },
    click = true,
    separator = " " .. icons.ui.ChevronRight .. " ",
    depth_limit = 0,
    depth_limit_indicator = "..",
  }
end

return M

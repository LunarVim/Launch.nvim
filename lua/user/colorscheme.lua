local M = { "catppuccin/nvim", name = "catppuccin", priority = 1000 }

function M.config()
  vim.cmd.colorscheme "catppuccin"
end

return M

local M = {
  "chentoast/marks.nvim",
}

M.config = function()
    require("marks").setup {
    default_mappings = true,
    signs = true,
    mappings = {}
  }
end

return M

local M = {
  "nacro90/numb.nvim",
  event = "VeryLazy",
}

function M.config()
  local status_ok, numb = pcall(require, "numb")
  if not status_ok then
    return
  end
  numb.setup {
    show_numbers = true, -- Enable 'number' for the window while peeking
    show_cursorline = true, -- Enable 'cursorline' for the window while peeking
  }
end

return M

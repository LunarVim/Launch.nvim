local colorscheme = "darkplus"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  require "notify"("Failed to load colorscheme", "error")
  return
end

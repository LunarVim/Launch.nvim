local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  vim.notify("Failed to load impatient", "error")
  return
end

impatient.enable_profile()

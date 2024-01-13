local M = {
  "karb94/neoscroll.nvim",
}

function M.config()
  vim.cmd [[
  nnoremap <C-j> <C-D>
  vnoremap <C-j> <C-D>

  nnoremap <C-k> <C-U>
  vnoremap <C-k> <C-U>
]]

  require("neoscroll").setup {
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb", "C-k", "C-j" },
    hide_cursor = true, -- Hide cursor while scrolling
    stop_eof = true, -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil, -- Default easing function
    pre_hook = nil, -- Function to run before the scrolling animation starts
    post_hook = nil, -- Function to run after the scrolling animation ends
    performance_mode = false, -- Disable "Performance Mode" on all buffers.
  }

  local t = {}
  -- Syntax: t[keys] = {function, {function arguments}}
  t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
  t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
  t["<C-k>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
  t["<C-j>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
  t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } }
  t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } }
  t["<C-y>"] = { "scroll", { "-0.10", "false", "100" } }
  t["<C-e>"] = { "scroll", { "0.10", "false", "100" } }
  t["zt"] = { "zt", { "250" } }
  t["zz"] = { "zz", { "250" } }
  t["zb"] = { "zb", { "250" } }

  require("neoscroll.config").set_mappings(t)
end

return M

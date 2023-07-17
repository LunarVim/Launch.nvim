local M = {
  "opalmay/vim-smoothie",
  event = "VeryLazy",
}

vim.g.smoothie_hide_cursor = 1

vim.cmd [[
  nnoremap <C-j> <cmd>call smoothie#do("\<C-D>") <CR>
  vnoremap <C-j> <cmd>call smoothie#do("\<C-D>") <CR>

  nnoremap <C-k> <cmd>call smoothie#do("\<C-U>") <CR>
  vnoremap <C-k> <cmd>call smoothie#do("\<C-U>") <CR>
]]

vim.g.smoothie_remapped_commands = {
  "<C-D>",
  "<C-U>",
  "<C-F>",
  "<S-Down>",
  "<PageDown>",
  "<C-B>",
  "<S-Up>",
  "<PageUp>",
  "z+",
  "z^",
  "zt",
  "z<CR>",
  "z.",
  "zz",
  "z-",
  "zb",
  -- "H",
  -- "M",
  -- "L",
  "{",
  "}",
  -- "j",
  -- "k",
  "<ScrollWheelDown>",
  "<ScrollWheelUp>",
  -- "gg",
  -- "G",
  -- "n",
  -- "N",
  -- "#",
  -- "*",
  -- "g*",
  -- "g#",
}

-- The following options were originally removed from the README by psliwka #22:

-- g:smoothie_update_interval: (default: 20) Time (in milliseconds) between subsequent screen/cursor position updates. Lower value produces smoother animation. Might be useful to increase it when running Vim over low-bandwidth/high-latency connections.
vim.g.smoothie_update_interval = 20
-- g:smoothie_speed_constant_factor: (default: 10) This value controls constant term of the velocity curve. Increasing this boosts primarily cursor speed at the end of animation.
vim.g.smoothie_speed_constant_factor = 15
-- g:smoothie_speed_linear_factor: (default: 10) This value controls linear term of the velocity curve. Increasing this boosts primarily cursor speed at the beginning of animation.
vim.g.smoothie_speed_linear_factor = 15
-- g:smoothie_speed_exponentiation_factor: (default: 0.9) This value controls exponent of the power function in the velocity curve. Generally should be less or equal to 1.0. Lower values produce longer but perceivably smoother animation.
-- g:smoothie_redraw_at_finish: Force screen redraw when the animation is finished, which clears sporadic display artifacts which I encountered f.ex. when scrolling through buffers containing emoji. Enabled by default only if both editor and terminal (kitty) supports doing this in a glitch-free way.

return M

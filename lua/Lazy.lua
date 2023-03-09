local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

-- load lazy
require("lazy").setup("user", {
  install = { colorscheme = { "catppuccin" } },
  defaults = { lazy = true, version = "*" },
  ui = { wrap = "true" },
  checker = { enabled = true },
  -- change_detection = { enabled = true },
  debug = false,
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        -- "gzip",
        -- "matchit",
        --  "matchparen",
        --  "netrwPlugin",
        --  "tarPlugin",
        --  "tohtml",
        --  "tutor",
        --  "zipPlugin",
      },
    },
  },
})

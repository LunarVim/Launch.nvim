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
  install = { colorscheme = { require("user.colorscheme").name } },
  defaults = { lazy = true, version = "32d5f4af2fdc0c04d60e3d5b5da3fc19a2c3699e" },
  ui = { wrap = "true" },
  checker = { enabled = true },
  change_detection = { enabled = true },
  debug = false,
  performance = {
    rtp = {
      disabled_plugins = {
        -- "gzip", -- Plugin for editing compressed files.
        -- "matchit", -- What is it?
        --  "matchparen", -- Plugin for showing matching parens
        --  "netrwPlugin", -- Handles file transfers and remote directory listing across a network
        --  "tarPlugin", -- Plugin for browsing tar files
        --  "tohtml", -- Converting a syntax highlighted file to HTML
        --  "tutor", -- Teaching?
        --  "zipPlugin", -- Handles browsing zipfiles
      },
    },
  },
})

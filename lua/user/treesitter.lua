local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
    -- {
    --   "HiPhish/nvim-ts-rainbow2",
    --   event = "VeryLazy",
    -- },
    {
      "windwp/nvim-ts-autotag",
      event = "VeryLazy",
    },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
    },
  },
}
function M.config()
  local configs = require "nvim-treesitter.configs"

  configs.setup {
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python" }, -- put the language you want in this array
    -- ensure_installed = "all"
    ignore_install = { "" },
    sync_install = false,
    highlight = { enable = true },
    autopairs = { enable = true },
    indent = { enable = true },
    matchup = {
      enable = { "astro" },
      disable = { "lua" },
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    autotag = { enable = true },
    -- rainbow = {
    --   enable = false,
    --   query = {
    --     "rainbow-parens",
    --   },
    --   strategy = require("ts-rainbow").strategy.global,
    --   hlgroups = {
    --     -- "TSRainbowRed",
    --     "TSRainbowBlue",
    --     -- "TSRainbowOrange",
    --     -- "TSRainbowCoral",
    --     "TSRainbowPink",
    --     "TSRainbowYellow",
    --     -- "TSRainbowViolet",
    --     -- "TSRainbowGreen",
    --   },
    -- },
  }
end

return M

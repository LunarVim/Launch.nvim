local M = {
  "HiPhish/rainbow-delimiters.nvim",
  lazy = true,
}

function M.config()
  -- This module contains a number of default definitions
  local rainbow_delimiters = require "rainbow-delimiters"

  vim.g.rainbow_delimiters = {
    strategy = {
      [""] = rainbow_delimiters.strategy["global"],
      vim = rainbow_delimiters.strategy["local"],
    },
    query = {
      [""] = "rainbow-delimiters",
      lua = "rainbow-blocks",
    },
    highlight = {

      -- "TSRainbowRed",
      "TSRainbowBlue",
      -- "TSRainbowOrange",
      -- "TSRainbowCoral",
      "TSRainbowPink",
      "TSRainbowYellow",
      -- "TSRainbowViolet",
      -- "TSRainbowGreen",

      -- "RainbowDelimiterRed",
      -- "RainbowDelimiterYellow",
      -- "RainbowDelimiterBlue",
      -- "RainbowDelimiterOrange",
      -- "RainbowDelimiterGreen",
      -- "RainbowDelimiterViolet",
      -- "RainbowDelimiterCyan",
    },
  }
end

return M

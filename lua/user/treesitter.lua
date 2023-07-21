local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      event = "VeryLazy",
    },
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
    {
      "HiPhish/nvim-ts-rainbow2",
      event = "VeryLazy",
    },
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
    textobjects = {
      select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["at"] = "@class.outer",
          ["it"] = "@class.inner",
          ["ac"] = "@call.outer",
          ["ic"] = "@call.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["ai"] = "@conditional.outer",
          ["ii"] = "@conditional.inner",
          ["a/"] = "@comment.outer",
          ["i/"] = "@comment.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          ["as"] = "@statement.outer",
          ["is"] = "@scopename.inner",
          ["aA"] = "@attribute.outer",
          ["iA"] = "@attribute.inner",
          ["aF"] = "@frame.outer",
          ["iF"] = "@frame.inner",
        },
      },
    },

    rainbow = {
      enable = false,
      query = {
        "rainbow-parens",
      },
      strategy = require("ts-rainbow").strategy.global,
      hlgroups = {
        -- "TSRainbowRed",
        "TSRainbowBlue",
        -- "TSRainbowOrange",
        -- "TSRainbowCoral",
        "TSRainbowPink",
        "TSRainbowYellow",
        -- "TSRainbowViolet",
        -- "TSRainbowGreen",
      },
    },
  }
end

return M

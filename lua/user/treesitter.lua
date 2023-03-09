local M = {
  "nvim-treesitter/nvim-treesitter",
  commit = "d3a68725e8349212a359d1914fc6e86ff31e4142",
  event = "BufReadPost",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
      commit = "a0f89563ba36b3bacd62cf967b46beb4c2c29e52",
    },
    {
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup {
          override = {
            zsh = {
              icon = "",
              color = "#428850",
              cterm_color = "65",
              name = "Zsh",
            },
          },
          color_icons = true,
          default = true,
        }
      end,
    },
  },
}
function M.config()
  local treesitter = require "nvim-treesitter"
  local configs = require "nvim-treesitter.configs"

  configs.setup {
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python" }, -- put the language you want in this array
    -- ensure_installed = "all", -- one of "all" or a list of languages
    ignore_install = { "" }, -- List of parsers to ignore installing
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "css" }, -- list of language that will be disabled
    },
    autopairs = {
      enable = true,
    },
    indent = { enable = true, disable = { "python", "css" } },

    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  }
end

return M

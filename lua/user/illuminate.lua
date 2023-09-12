local M = {
  "RRethy/vim-illuminate",
  commit = "d6ca7f77eeaf61b3e6ce9f0e5a978d606df44298",
  event = "VeryLazy",
}

function M.config()
  local illuminate = require "illuminate"
  illuminate.configure {
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    delay = 200,
    filetypes_denylist = {
      "dirvish",
      "fugitive",
      "alpha",
      "NvimTree",
      "packer",
      "neogitstatus",
      "Trouble",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "TelescopePrompt",
    },
    filetypes_allowlist = {},
    modes_denylist = {},
    modes_allowlist = {},
    providers_regex_syntax_denylist = {},
    providers_regex_syntax_allowlist = {},
    under_cursor = true,
  }
end

return M

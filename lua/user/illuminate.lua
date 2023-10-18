local M = {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  commit = "3bd2ab64b5d63b29e05691e624927e5ebbf0fb86",
}

function M.config()
  require("illuminate").configure {
    filetypes_denylist = {
      "mason",
      "harpoon",
      "DressingInput",
      "NeogitCommitMessage",
      "qf",
      "dirvish",
      "minifiles",
      "fugitive",
      "alpha",
      "NvimTree",
      "lazy",
      "NeogitStatus",
      "Trouble",
      "netrw",
      "lir",
      "DiffviewFiles",
      "Outline",
      "Jaq",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "TelescopePrompt",
    },
  }
end

return M

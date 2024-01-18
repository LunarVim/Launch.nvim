local M = {
  "kawre/neotab.nvim",
  event = "InsertEnter",
}

function M.config()
  require("neotab").setup
 {
    tabkey = "<Tab>",
    act_as_tab = true, -- fallback to tab, if `tabout` action is not available
    behavior = "nested", ---@type ntab.behavior
    pairs = { ---@type ntab.pair[]
      { open = "(", close = ")" },
      { open = "[", close = "]" },
      { open = "{", close = "}" },
      { open = "'", close = "'" },
      { open = '"', close = '"' },
      { open = "`", close = "`" },
      { open = "<", close = ">" },
    },
    exclude = {},
    smart_punctuators = {
      enabled = false,
      semicolon = {
        enabled = false,
        ft = { "cs", "c", "cpp", "java" },
      },
      escape = {
        enabled = false,
        triggers = {}, ---@type table<string, ntab.trigger>
      },
    },
  }
end

return M

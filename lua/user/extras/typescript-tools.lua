local M = {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
}

function M.config()
  local lspconfig = require "user.lspconfig"
  require("typescript-tools").setup {
    on_attach = function(client)
      lspconfig.on_attach()
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
    capabilities = lspconfig.common_capabilities(),
    settings = {
      -- spawn additional tsserver instance to calculate diagnostics on it
      separate_diagnostic_server = true,
      -- "change"|"insert_leave" determine when the client asks the server about diagnostic
      -- publish_diagnostic_on = "insert_leave",
      -- array of strings("fix_all"|"add_missing_imports"|"remove_unused")
      -- specify commands exposed as code_actions
      expose_as_code_action = { "fix_all", "add_missing_imports", "remove_unused" },
      -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
      -- not exists then standard path resolution strategy is applied
      -- tsserver_path = nil,
      -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
      -- (see 💅 `styled-components` support section)
      -- tsserver_plugins = {},
      -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
      -- memory limit in megabytes or "auto"(basically no limit)
      tsserver_max_memory = "auto",
      -- described below
      -- tsserver_format_options = {},
      tsserver_file_preferences = {
        includeInlayParameterNameHints = "all",
        -- includeCompletionsForModuleExports = true,
        -- quotePreference = "auto",
      },
    },
  }
end

return M

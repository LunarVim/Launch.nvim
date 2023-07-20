local M = {
  "jose-elias-alvarez/null-ls.nvim",
}

function M.config()
  local null_ls = require "null-ls"

  null_ls.setup {
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      -- null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.completion.spell,
    },
  }
end

return M

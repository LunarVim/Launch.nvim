local M = {
  "jose-elias-alvarez/null-ls.nvim",
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    sources = {
      formatting.stylua,
      -- formatting.prettier,
      -- formatting.prettier.with {
      -- extra_filetypes = { "toml" },
      -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      -- null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.completion.spell,
      formatting.goimports_reviser,
      formatting.gofumpt,
      formatting.golines,
      formatting.black,

      diagnostics.flake8,
      diagnostics.golangci_lint,
    },
  }
end

return M

local M = {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

function M.config()
	local null_ls = require "null-ls"

	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics
	local completion = null_ls.builtins.completion
	local actions = null_ls.builtins.code_actions

	null_ls.setup {
		debug = false,
		sources = {
			-- LUA
			-- formatting.stylua,

			-- golang
			formatting.goimports_reviser,
			formatting.gofumpt,
			formatting.golines,

			diagnostics.golangci_lint,
			actions.gomodifytags,

			formatting.eslint,

			-- PYTHON
			diagnostics.flake8,
			formatting.black,

			formatting.prettier.with {
				extra_filetypes = { "toml" },
				extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
			},

			-- GENERAL
			completion.spell,
		},
	}
end

return M

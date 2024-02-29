local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
}

function M.config()
	local servers = {
		"lua_ls",
		"cssls",
		"html",
		"tsserver",
		"pyright",
		"bashls",
		"jsonls",
		"yamlls",
	}

	require("mason").setup {
		ui = {
			border = "rounded",
			icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
		},
	}
	require("mason-lspconfig").setup {}
end

return M

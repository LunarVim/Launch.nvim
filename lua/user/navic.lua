local M = {
	"SmiteshP/nvim-navic",
}

function M.config()
	local icons = require "user.icons"
	require("nvim-navic").setup {
		icons = icons.kind,
		highlight = true,
		lsp = {
			auto_attach = true,
			preference = {
				-- Assuming your template server is named "template_ls"
				templ_ls = 10,
				-- Assuming your HTML server is named "html_ls"
				html_ls = 5,
			},
		},
		click = true,
		separator = " " .. icons.ui.ChevronRight .. " ",
		depth_limit = 0,
		depth_limit_indicator = "..",
	}
end

return M

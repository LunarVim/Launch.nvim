local M = {
	"LunarVim/darkplus.nvim",
	lazy = false,  -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	dependencies = {
		"sainnhe/gruvbox-material",
		"cryptomilk/nightcity.nvim",
		-- "luisiacc/gruvbox-baby",
		"sainnhe/everforest",
		"EdenEast/nightfox.nvim",
	},
}

function M.config()
	vim.cmd.colorscheme "gruvbox-material"
end

return M

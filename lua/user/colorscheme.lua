local M = {
	"LunarVim/darkplus.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	dependencies = {
		"sainnhe/gruvbox-material",
		"cryptomilk/nightcity.nvim",
		"luisiacc/gruvbox-baby",
		"sainnhe/everforest",
		"EdenEast/nightfox.nvim",
		"folke/tokyonight.nvim",
		{ "rose-pine/neovim", name = "rose-pine" },
		"Shatur/neovim-ayu",
		"olimorris/onedarkpro.nvim",
	},
}

function M.config()
	-- Example config in Lua
	-- vim.g.gruvbox_baby_function_style = "italic"
	vim.g.gruvbox_baby_keyword_style = "italic"
	-- vim.g.gruvbox_baby_background_color = "dark"
	vim.g.gruvbox_baby_transparent_mode = "true"
	vim.g.gruvbox_baby_use_original_palette = true


	-- Each highlight group must follow the structure:
	-- ColorGroup = {fg = "foreground color", bg = "background_color", style = "some_style(:h attr-list)"}
	-- See also :h highlight-guifg
	-- Example:
	-- vim.g.gruvbox_baby_highlights = { Normal = { fg = "#123123", bg = "NONE", style = "underline" } }

	-- Enable telescope theme
	-- vim.g.gruvbox_baby_telescope_theme = 1

	-- Load the colorscheme
	-- require("onedarkpro").setup({
	-- 	highlights = {
	-- 		CmpMenuSelected = { fg = "#FF0000", bg = "#FFFF00", italic = true }
	-- 	}
	-- })

	vim.cmd.colorscheme "gruvbox-baby"
end

return M

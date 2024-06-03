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
		"RRethy/base16-nvim"
	},
}

function M.config()
	-- Example config in Lua
	-- vim.g.gruvbox_baby_keyword_style = "italic"
	-- vim.g.gruvbox_baby_background_color = "dark"
	-- vim.g.gruvbox_baby_use_original_palette = true

	-- To disable highlights for supported plugin(s), call the `with_config` function **before** setting the colorscheme.
	-- These are the defaults.
	require('base16-colorscheme').with_config({
		telescope = true,
		indentblankline = true,
		notify = true,
		ts_rainbow = true,
		cmp = true,
		illuminate = true,
		dapui = true,
	})
	if vim.env.MACOS_THEME_MODE == "dark" then
		vim.cmd('colorscheme tokyonight-night')
	else
		vim.cmd('colorscheme tokyonight-moon')
	end

	-- You can get the base16 colors **after** setting the colorscheme by name (base01, base02, etc.)
end

return M

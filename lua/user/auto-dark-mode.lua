local M = {
 'f-person/auto-dark-mode.nvim',
  event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
  require("auto-dark-mode").setup {
    update_interval = 5000,
	set_dark_mode = function()
		vim.api.nvim_set_option('background', 'dark')
		vim.cmd('colorscheme tokyonight-storm')
	end,
	set_light_mode = function()
		vim.api.nvim_set_option('background', 'light')
		vim.cmd('colorscheme github')
	end,

  }
  
end

return M

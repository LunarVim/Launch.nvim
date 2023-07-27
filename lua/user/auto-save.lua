local M = {
  "Pocco81/auto-save.nvim",
  commit = "979b6c82f60cfa80f4cf437d77446d0ded0addf0",
  event = "VeryLazy",
}

function M.config()
 require("auto-save").setup {
			-- your config goes here
			-- or just leave it empty :)
		 }
end

return M

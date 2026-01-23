return {
	--    { 
	-- "catppuccin/nvim",
	-- name = "catppuccin",
	-- priority = 0,
	-- config = function()
	--     vim.cmd.colorscheme "catppuccin-mocha"
	-- end,
	--    },

	{
	    "EdenEast/nightfox.nvim",
	    lazy = false,
	    priority = 1000,
	    config = function()
		vim.cmd("colorscheme carbonfox")
	    end,
	},

	-- {
	--     "navarasu/onedark.nvim",
	--     priority = 1000,
	--     config = function()
	-- 	require('onedark').setup{
	-- 	    style = 'warmer'
	-- 	}
	-- 	require('onedark').load()
	--     end,
	-- },

	-- {
	--     "olimorris/onedarkpro.nvim",
	--     priority = 1000,
	--     config = function()
	-- 	vim.cmd("colorscheme onedark_dark")
	--     end,
	-- },
}

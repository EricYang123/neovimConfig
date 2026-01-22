return {
    {
	'akinsho/toggleterm.nvim', 
	config = function()
	    require("toggleterm").setup{
		direction = "vertical",
		open_mapping = [[<c-\>]],
		size = function(term)
		    if term.direction == "horizontal" then
		      return vim.o.lines * 0.4
		    elseif term.direction == "vertical" then
		      return vim.o.columns * 0.4
		    end
		end,
	    }
	    vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Vertical terminal" }) 
	    vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Horizontal terminal" }) 
	    vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Floating terminal" })
	end,
    },

}

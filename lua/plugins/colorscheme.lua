return {
	{
		"rose-pine/neovim",
		name = "rose-pine",

        config = function()
			vim.cmd.colorscheme("rose-pine")

            -- below changes the background for the different highlight groups to none for transparent backgrounds 
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		end,
	},
}

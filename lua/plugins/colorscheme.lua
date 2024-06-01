return {
	{
        "ellisonleao/gruvbox.nivm",
		name = "gruvbox",
        config = function()
            vim.o.background = "dark"
			vim.cmd.colorscheme("gruvbox")

            -- below changes the background for the different highlight groups to none for transparent backgrounds 
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
            vim.api.nvim_set_hl(0, "normalfloat", { bg = "none" })
            vim.api.nvim_set_hl(0, "FloatBoarder", { bg = "none" })
		end,
	},
}

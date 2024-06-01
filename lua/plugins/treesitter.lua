return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				auto_installed = true,
                ensure_installed = {
                    "vimdoc",
                },
				highlight = {
                    enable = true,
                    aditional_vim_regex_highlighting = { "markdown", },
                },
				indent = { enable = true },
			})

            local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            treesitter_parser_config.templ = {
                install_info = {
                    url = "https://github.com/vrischmann/tree-sitter-templ.git",
                    files = {"src/parser.c", "src/scanner.c"},
                    branch = "master",
                },
            }

            vim.treesitter.language.register("templ", "templ")
		end,
	},
	{
		"nvim-treesitter/playground",
	},
}

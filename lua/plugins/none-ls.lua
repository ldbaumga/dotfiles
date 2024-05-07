return {
    "nvimtools/none-ls.nvim",
    -- use :Mason to install linters/formatters i.e. stylua,
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}

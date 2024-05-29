return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                -- for list of supporeted lsps, go to mason-lspconfig github
                ensure_installed = { "lua_ls", "pyright", "clangd", "gopls", "html", "htmx"},
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.pyright.setup({
                capabilities = capabilities,
            })

            lspconfig.clangd.setup({
                capabilities = capabilities,
            })

            lspconfig.gopls.setup({
                capabilities = capabilities,
            })

            lspconfig.html.setup({
                capabilities = capabilities,
            })

            lspconfig.htmx.setup({
                capabilities = capabilities,
            })

            -- :h vim.lsp.buf for functions to call
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("i", "<C-j>", function () vim.lsp.buf.signature_help() end, {})
        end,
    },
}

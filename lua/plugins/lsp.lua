return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { 'lua_ls', 'basedpyright', 'vtsls', 'tinymist', 'rust_analyzer' },
            automatic_installation = true,
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function(_, opts)
            require("mason").setup()
            require("mason-lspconfig").setup(opts)
            vim.lsp.enable({ 'lua_ls', 'basedpyright', 'vtsls', 'tinymist', 'rust_analyzer' })
        end,
    },
}

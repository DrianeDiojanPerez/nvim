return {
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = { "lua_ls" },
        },
    },
    {
        "saghen/blink.cmp",
        version = "1.*",
        opts = {
            keymap = { preset = "default" },
            completion = { documentation = { auto_show = true } },
            sources = { default = { "lsp", "path", "snippets", "buffer" } },
        },
    },
}

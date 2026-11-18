return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install({
            "bash",
            "c",
            "css",
            "diff",
            "dockerfile",
            "gitcommit",
            "go",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "php",
            "python",
            "query",
            "rust",
            "sql",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "yaml",
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                if pcall(vim.treesitter.start) then
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}

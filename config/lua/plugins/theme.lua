return {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
        require("rose-pine").setup({
            styles = { transparency = true },
        })
        vim.cmd.colorscheme("rose-pine")

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1f1d2e" })
        vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1f1d2e" })
        vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#26233a" })
        vim.api.nvim_set_hl(0, "Visual", { bg = "#343549" })
    end,
}

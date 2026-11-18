return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = { "node_modules", ".git/" },
            },
            pickers = {
                find_files = { hidden = true },
                live_grep = {
                    additional_args = function()
                        return { "--hidden" }
                    end,
                },
            },
        })

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>f", builtin.find_files)
        vim.keymap.set("n", "<leader>s", builtin.live_grep)
        vim.keymap.set("n", "<leader>vh", builtin.help_tags)
        vim.keymap.set("n", "<leader>ws", function()
            builtin.grep_string({ search = vim.fn.expand("<cword>") })
        end)
        vim.keymap.set("n", "<leader>wf", function()
            builtin.find_files({ default_text = vim.fn.expand("<cword>") })
        end)
    end,
}

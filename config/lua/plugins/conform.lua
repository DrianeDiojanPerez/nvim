return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                fish = { "fish_indent" },
                sh = { "shfmt" },
                php = { "phpcbf" },
                go = { "gofmt" },
                templ = { "templ" },
                json = { "jq" },
                rust = function()
                    for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
                        if line:match("rsx!") then
                            return { "dx_fmt" }
                        end
                    end
                    return { "rustfmt" }
                end,
            },
            formatters = {
                injected = { options = { ignore_errors = true } },
                dx_fmt = {
                    command = "dx",
                    args = { "fmt", "--file", "$FILENAME" },
                    stdin = false,
                    require_cwd = true,
                },
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>=", function()
            conform.format({ lsp_format = "fallback", timeout_ms = 1000 }, function(err)
                if err then
                    vim.notify("Format error: " .. err, vim.log.levels.ERROR)
                    return
                end
                local formatters = conform.list_formatters(0)
                local clients = vim.lsp.get_clients({ bufnr = 0 })
                if #formatters > 0 then
                    local names = vim.tbl_map(function(f)
                        return f.name
                    end, formatters)
                    vim.notify("Formatted with conform: " .. table.concat(names, ", "))
                elseif #clients > 0 then
                    vim.notify("Formatted with LSP: " .. clients[1].name)
                else
                    vim.notify("No formatter found", vim.log.levels.WARN)
                end
            end)
        end, { desc = "Format file or selection" })
    end,
}

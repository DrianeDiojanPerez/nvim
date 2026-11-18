local group = vim.api.nvim_create_augroup("Basic", {})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = group,
    callback = function()
        vim.hl.on_yank({ higroup = "IncSearch", timeout = 40 })
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    group = group,
    command = [[%s/\s\+$//e]],
})

-- Undo files keep old versions of the text in plain text, secrets included.
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    group = group,
    pattern = { ".env*", "*.env", "*.pem", "*.key", "wrangler.toml", ".dev.vars" },
    callback = function()
        vim.opt_local.undofile = false
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition({
                on_list = function(options)
                    local seen = {}
                    local items = {}
                    for _, item in ipairs(options.items) do
                        local key = item.filename .. ":" .. item.lnum
                        if not seen[key] then
                            seen[key] = true
                            table.insert(items, item)
                        end
                    end

                    vim.fn.setqflist({}, " ", { title = options.title, items = items })
                    if #items == 1 then
                        vim.cmd("cfirst")
                    else
                        vim.cmd("copen")
                    end
                end,
            })
        end, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    end,
})

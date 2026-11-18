return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = false },
        indent = { enabled = true },
        input = { enabled = true },
        picker = { enabled = false },
        notifier = {
            enabled = true,
            -- snacks' "fancy" style, with the level name as the title when a message has none.
            style = function(buf, notif, ctx)
                local levels = { error = "Error", warn = "Warning", info = "Info", debug = "Debug", trace = "Trace" }
                local title = notif.title ~= "" and notif.title or levels[notif.level] or ""

                vim.api.nvim_buf_set_lines(buf, 0, 1, false, { "", "" })
                vim.api.nvim_buf_set_lines(buf, 2, -1, false, vim.split(notif.msg, "\n"))
                vim.api.nvim_buf_set_extmark(buf, ctx.ns, 0, 0, {
                    virt_text = { { " " }, { notif.icon, ctx.hl.icon }, { " " }, { title, ctx.hl.title } },
                    virt_text_win_col = 0,
                    priority = 10,
                })
                vim.api.nvim_buf_set_extmark(buf, ctx.ns, 0, 0, {
                    virt_text = { { " " }, { os.date(ctx.notifier.opts.date_format, notif.added), ctx.hl.title }, { " " } },
                    virt_text_pos = "right_align",
                    priority = 10,
                })
                vim.api.nvim_buf_set_extmark(buf, ctx.ns, 1, 0, {
                    virt_text = { { string.rep("━", vim.o.columns - 2), ctx.hl.border } },
                    virt_text_win_col = 0,
                    priority = 10,
                })
            end,
        },
        quickfile = { enabled = true },
        scope = { enabled = true },
        -- Smooth scrolling redraws the screen many times per jump, which lags over SSH.
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
}

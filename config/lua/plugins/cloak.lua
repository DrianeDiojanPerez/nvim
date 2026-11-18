return {
    "laytan/cloak.nvim",
    opts = {
        cloak_character = "*",
        highlight_group = "Comment",
        patterns = {
            {
                file_pattern = { ".env*", "wrangler.toml", ".dev.vars" },
                cloak_pattern = "=.+",
            },
        },
    },
}

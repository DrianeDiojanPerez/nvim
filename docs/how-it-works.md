# How it works

The repo holds the config in `config/` and a `setup.sh` that installs everything on a new machine. `setup.sh` makes `~/.config/nvim` a link to `~/code/nvim/config`, so nvim reads the config straight from the repo. A change you make in the repo, or pull with `git pull`, takes effect the next time you open nvim.

```
config/
├── init.lua             loads the four core files in order
└── lua/
    ├── core/
    │   ├── options.lua  numbers, tabs, undo, search, background
    │   ├── keymaps.lua  general keymaps
    │   ├── autocmds.lua yank highlight, trailing space trim, LSP keymaps
    │   └── lazy.lua     installs lazy.nvim and loads lua/plugins/
    └── plugins/         one file per plugin group
```

`core/lazy.lua` clones lazy.nvim on the first start, then loads every file in `lua/plugins/`. To add a plugin, add a file there that returns a lazy.nvim spec.

Space is the leader key.

## Built for a production server

- Plugin versions are pinned in `lazy-lock.json`, so the server only gets versions you tried on your desktop first. See [Updating](update.md#plugin-versions).
- snacks.nvim's bigfile turns off Treesitter and the LSP for very large files, so a big log opens right away instead of freezing nvim.
- cloak.nvim hides the values in `.env`, `wrangler.toml`, and `.dev.vars` files.
- Undo history isn't saved for `.env*`, `*.env`, `*.pem`, `*.key`, `wrangler.toml`, and `.dev.vars` files. Neovim saves undo history as plain text in `~/.local/state/nvim/undo/`, so it would keep old secrets around.
- `setup.sh` sets `NVIM_NOTTYFAST=1`, which stops the E1568 warning and the slow start over SSH.
- Only `lua_ls` comes installed, and conform has no formatters that need Node, so Node isn't needed on the server.

## Where things live

| What | Where |
|---|---|
| Config | `~/code/nvim/config`, linked from `~/.config/nvim` |
| Plugin versions (`lazy-lock.json`) | `~/code/nvim/config/`, committed to pin the versions |
| Plugins | `~/.local/share/nvim/lazy/` |
| LSP servers from Mason | `~/.local/share/nvim/mason/` |
| Treesitter parsers | `~/.local/share/nvim/site/parser/` |
| Undo history | `~/.local/state/nvim/undo/` |
| Logs (`lsp.log`, `mason.log`) | `~/.local/state/nvim/` |
| Neovim | `/opt/nvim-linux-x86_64`, linked from `/usr/local/bin/nvim` |
| tree-sitter CLI | `/usr/local/bin/tree-sitter` |

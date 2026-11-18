# How it works

The repo holds the config in `config/` and a `setup.sh` that installs everything on a new machine. `setup.sh` copies `config/` to `~/.config/nvim`. It copies the files instead of linking them, so a change in `~/code/nvim` only takes effect after `./setup.sh --config`.

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

## Where things live

| What | Where |
|---|---|
| Config | `~/.config/nvim` |
| Plugins | `~/.local/share/nvim/lazy/` |
| LSP servers from Mason | `~/.local/share/nvim/mason/` |
| Treesitter parsers | `~/.local/share/nvim/site/parser/` |
| Undo history | `~/.local/state/nvim/undo/` |
| Logs (`lsp.log`, `mason.log`) | `~/.local/state/nvim/` |
| Neovim | `/opt/nvim-linux-x86_64`, linked from `/usr/local/bin/nvim` |
| tree-sitter CLI | `/usr/local/bin/tree-sitter` |

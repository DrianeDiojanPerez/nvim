# Plugins

| Plugin | File | What it does |
|---|---|---|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | `core/lazy.lua` | Installs and loads the plugins. `:Lazy` opens it |
| [rose-pine](https://github.com/rose-pine/neovim) | `theme.lua` | Color scheme, with a transparent background |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | `telescope.lua` | Find files and search text. Needs `ripgrep` |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | `treesitter.lua` | Better colors and indenting. Needs the tree-sitter CLI and a C compiler |
| [mason.nvim](https://github.com/mason-org/mason.nvim) | `lsp.lua` | Installs language servers. `:Mason` opens it |
| [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) | `lsp.lua` | Starts the servers Mason installed |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | `lsp.lua` | Default settings for each server |
| [blink.cmp](https://github.com/saghen/blink.cmp) | `lsp.lua` | Completion menu |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | `conform.lua` | Formats with `<leader>=`. Never formats on save |
| [cloak.nvim](https://github.com/laytan/cloak.nvim) | `cloak.lua` | Shows `*` in place of the values in `.env` files. `:CloakToggle` shows them |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | `nvim-tree.lua` | File tree on the left with `<leader>e`. Replaces netrw |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | `nvim-tree.lua` | File icons in the tree. Your terminal needs a Nerd Font |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | `git.lua` | Shows changed lines next to the line numbers |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | `git.lua` | Git commands in nvim with `:Git` |
| [undotree](https://github.com/mbbill/undotree) | `undotree.lua` | Shows the undo history as a tree |

## Add a language server

Open `:Mason`, find the server, and press `i`. It starts the next time you open a file of that type.

To install it on every new machine, add its name to `ensure_installed` in `config/lua/plugins/lsp.lua`:

```lua
ensure_installed = { "lua_ls", "gopls", "intelephense" },
```

Some servers need other tools on the machine, for example `npm` for `ts_ls` and `html`, or Go for `gopls`.

## Formatters

`<leader>=` formats the file, or the selection in visual mode. It uses the formatter set for the file type in `config/lua/plugins/conform.lua`, for example `stylua` for Lua, `shfmt` for shell, and `jq` for JSON. If the file type has no formatter, or the formatter isn't installed, it asks the language server to format. A message says which one ran.

`setup.sh` installs `jq` with apt. The other formatters don't come installed. Add the ones you need with `:Mason`, for example `stylua` or `shfmt`. The list leaves out formatters that need Node, like `prettier`, `eslint_d`, and `blade-formatter`, so Node never ends up on the production server. HTML, JavaScript, and TypeScript fall back to the language server, if one is installed.

## Add a Treesitter language

Add its name to the list in `config/lua/plugins/treesitter.lua`, or run `:TSInstall <name>` once. These languages come installed: bash, c, css, diff, dockerfile, gitcommit, go, html, javascript, json, lua, markdown, php, python, query, rust, sql, toml, tsx, typescript, vim, vimdoc, and yaml.

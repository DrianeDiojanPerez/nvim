# Updating

| What | How |
|---|---|
| The config | `git -C ~/code/nvim pull && ~/code/nvim/setup.sh --config` |
| Plugins | `:Lazy sync` in nvim |
| LSP servers | `:Mason`, then `U` to update all |
| Treesitter parsers | `:TSUpdate` in nvim |
| Neovim and the tree-sitter CLI | `~/code/nvim/setup.sh` |

The full `setup.sh` always downloads the latest Neovim release, so running it again is how you update Neovim. It also copies the config again, which moves your current `~/.config/nvim` to a backup first.

Check your version with `nvim --version`.

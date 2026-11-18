# nvim

My basic Neovim setup for a new machine: my options and keymaps, rose-pine, Telescope, Treesitter, LSP with completion, git signs, fugitive, and undotree. Built for Debian and Ubuntu.

- [Install](#install)
- [Update](#update)
- [Manual install](#manual-install)
- [Test](#test)
- [Docs](#docs)

## Install

```
git clone https://github.com/DrianeDiojanPerez/nvim.git ~/code/nvim && ~/code/nvim/setup.sh
```

It asks for your sudo password. When it finishes, open `nvim` once and wait a minute while Mason installs `lua_ls` and Treesitter builds its parsers.

## Update

```
git -C ~/code/nvim pull
```

`~/.config/nvim` links to `~/code/nvim/config`, so the pull updates the config. Then run `:Lazy restore` in nvim to move the plugins to the versions in `lazy-lock.json`. See [Updating](docs/update.md) for updating Neovim itself.

## Manual install

1. Install the tools the plugins need:
   ```
   sudo apt install git curl unzip tar gzip ripgrep fd-find jq build-essential
   ```
2. Install the latest Neovim:
   ```
   curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
   sudo rm -rf /opt/nvim-linux-x86_64
   sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
   sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
   ```
   On ARM, use `arm64` in place of `x86_64`.
3. Install the tree-sitter CLI, which Treesitter needs to build parsers:
   ```
   curl -LO https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-linux-x64.gz
   gunzip tree-sitter-linux-x64.gz
   sudo install -m 755 tree-sitter-linux-x64 /usr/local/bin/tree-sitter
   ```
4. Link the config, after moving any old one out of the way:
   ```
   mv ~/.config/nvim ~/.config/nvim.bak
   ln -s ~/code/nvim/config ~/.config/nvim
   ```
5. Open `nvim`. lazy.nvim installs the plugins on the first start.

## Test

- `nvim --version` shows the latest release.
- Open a `.lua` file. The code is colored by Treesitter, and `:LspInfo` shows `lua_ls` attached.
- Press `space f` in a project folder. Telescope opens a file picker.

## Docs

- [How it works](docs/how-it-works.md): how the config is laid out and where things live
- [Installing](docs/install.md): what `setup.sh` does, step by step
- [Updating](docs/update.md): Neovim, plugins, and the config
- [Keymaps](docs/keymaps.md): every key this config adds
- [Plugins](docs/plugins.md): what each plugin does, and how to add languages
- [Troubleshooting](docs/troubleshooting.md)
- [Uninstall](docs/uninstall.md)

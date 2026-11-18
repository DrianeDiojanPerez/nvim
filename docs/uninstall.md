# Uninstall

Remove the config link, plugins, and everything Neovim saved:

```
rm ~/.config/nvim
rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
```

`rm ~/.config/nvim` removes only the link. The config stays in `~/code/nvim` until you delete the repo.

Remove Neovim and the tree-sitter CLI:

```
sudo rm -rf /opt/nvim-linux-x86_64 /usr/local/bin/nvim /usr/local/bin/tree-sitter
```

To go back to the config you had before, move its backup back:

```
mv ~/.config/nvim.bak.<date and time> ~/.config/nvim
```

The apt packages from `setup.sh` stay installed, because other programs may use them.

# Updating

| What | How |
|---|---|
| The config | `git -C ~/code/nvim pull` |
| Plugins | `:Lazy restore` in nvim, after the pull |
| LSP servers | `:Mason`, then `U` to update all |
| Treesitter parsers | `:TSUpdate` in nvim |
| Neovim and the tree-sitter CLI | `~/code/nvim/setup.sh` |

The full `setup.sh` always downloads the latest Neovim release, so running it again is how you update Neovim. It leaves the config link alone.

Check your version with `nvim --version`.

## Plugin versions

This config runs on a production server, so the plugin versions are pinned in `config/lazy-lock.json` and committed. `:Lazy restore` installs exactly those versions. Don't run `:Lazy sync` or `:Lazy update` on the server: they pull the newest plugins and change `lazy-lock.json`, and the next `git pull` then conflicts.

To move to newer plugins, update them on your desktop first:

1. Link the config under another name once, so it doesn't touch your desktop config:
   ```
   ln -s ~/code/nvim/config ~/.config/nvim-server
   ```
2. Open it with `NVIM_APPNAME=nvim-server nvim`, run `:Lazy update`, and check that everything still works.
3. Commit the changed `config/lazy-lock.json` and push.
4. On the server, `git -C ~/code/nvim pull`, then `:Lazy restore` in nvim.

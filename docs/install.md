# Installing

## setup.sh

```
~/code/nvim/setup.sh
```

It runs these steps in order and asks for your sudo password:

1. Installs `git`, `curl`, `unzip`, `tar`, `gzip`, `ripgrep`, `fd-find`, and `build-essential` with `apt-get`. On a system without apt it prints the list for you to install yourself.
2. Downloads the latest Neovim release, unpacks it to `/opt/nvim-linux-x86_64` (or `arm64`), and links `/usr/local/bin/nvim` to it. An older Neovim from apt stays installed, but `/usr/local/bin` comes first in PATH, so `nvim` runs the new one.
3. Downloads the tree-sitter CLI to `/usr/local/bin/tree-sitter`. If the binary won't run, it prints a warning and keeps going.
4. Moves any existing `~/.config/nvim` to `~/.config/nvim.bak.<date and time>` and links `~/.config/nvim` to `~/code/nvim/config`. If the link is already there, it leaves it alone.
5. Starts nvim in the background to install the plugins, then prints the Neovim version.

Run it again any time. Every step replaces what the last run installed.

## Only the config

```
~/code/nvim/setup.sh --config
```

Skips steps 1 to 3. You only need it once, to set up the link. After that, `git pull` updates the config.

## Moving from a copied config

An older `setup.sh` copied the config instead of linking it. If you installed with that version, run this once:

```
git -C ~/code/nvim pull && ~/code/nvim/setup.sh --config
```

It moves the copy to `~/.config/nvim.bak.<date and time>` and puts the link in its place. Delete the backup once nvim works.

## First start

Open `nvim` once after installing and wait about a minute. Mason installs `lua_ls` and Treesitter builds its parsers in the background. Mason skips this during the install in step 5, because it doesn't install anything when nvim runs without a window.

Tested on Arch with Neovim 0.12.6. Built for Debian and Ubuntu.

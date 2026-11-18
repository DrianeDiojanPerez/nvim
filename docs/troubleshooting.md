# Troubleshooting

Start with `:checkhealth`, then `:Lazy` and `:Mason` to see if anything failed to install.

- **"E1568: Terminal did not respond to DSR request for 'background' color":** the terminal didn't answer Neovim's color question in time. This happens most over SSH. Turn the question off with `echo 'export NVIM_NOTTYFAST=1' >> ~/.bashrc` and open a new shell. Setting it in the config doesn't work, because Neovim asks before it reads the config.
- **Opening or closing nvim feels slow:** compare `time nvim --clean +q` with `time nvim +q`. If both are slow, the terminal or SSH connection is the cause, and `NVIM_NOTTYFAST=1` can help. If only the second is slow, check `:LspInfo` for a server that's stuck.
- **No LSP in a file:** `:LspInfo` shows what's running. If the server isn't installed, add it with `:Mason`. `lua_ls` installs on the first normal start, not during `setup.sh`.
- **Treesitter parsers fail to build:** run `tree-sitter --version`. If it fails, the downloaded binary may need a newer glibc than your system has. Install it with `npm i -g tree-sitter-cli` instead, then run `:TSUpdate`.
- **`<leader>s` finds nothing:** Telescope's text search needs `ripgrep`. Install it with `sudo apt install ripgrep`.
- **`nvim` still opens the old version:** run `which nvim`. It should print `/usr/local/bin/nvim`. If it prints `/usr/bin/nvim`, remove the old one with `sudo apt remove neovim`.
- **Mason fails to install a server:** check `~/.local/state/nvim/mason.log`. Most servers need `unzip` and `curl`, and some need `npm` or Go.

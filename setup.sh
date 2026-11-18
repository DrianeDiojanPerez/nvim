#!/usr/bin/env bash
# Usage: ./setup.sh             install deps, latest nvim, and this config
#        ./setup.sh --config    only link the config
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
target="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

case "$(uname -m)" in
    x86_64) nvim_arch="x86_64"; ts_arch="x64" ;;
    aarch64 | arm64) nvim_arch="arm64"; ts_arch="arm64" ;;
    *) echo "Unsupported architecture: $(uname -m)" >&2; exit 1 ;;
esac

install_deps() {
    if command -v apt-get >/dev/null; then
        sudo apt-get update
        sudo apt-get install -y git curl unzip tar gzip ripgrep fd-find build-essential
    else
        echo "No apt-get found. Install git, curl, unzip, ripgrep and a C compiler yourself."
    fi
}

install_nvim() {
    local tmp
    tmp="$(mktemp -d)"
    curl -fL -o "$tmp/nvim.tar.gz" \
        "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-$nvim_arch.tar.gz"
    sudo rm -rf "/opt/nvim-linux-$nvim_arch"
    sudo tar -C /opt -xzf "$tmp/nvim.tar.gz"
    sudo ln -sf "/opt/nvim-linux-$nvim_arch/bin/nvim" /usr/local/bin/nvim
    rm -rf "$tmp"
}

# nvim-treesitter needs the tree-sitter CLI to build parsers.
install_tree_sitter() {
    local tmp
    tmp="$(mktemp -d)"
    curl -fL -o "$tmp/tree-sitter.gz" \
        "https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-linux-$ts_arch.gz"
    gunzip "$tmp/tree-sitter.gz"
    sudo install -m 755 "$tmp/tree-sitter" /usr/local/bin/tree-sitter
    rm -rf "$tmp"
    tree-sitter --version || echo "tree-sitter CLI failed to run, treesitter parsers will not build."
}

link_config() {
    local source="$here/config"
    if [ "$(readlink -f "$target")" = "$source" ]; then
        echo "$target already links to $source"
        return
    fi
    if [ -e "$target" ] || [ -L "$target" ]; then
        local backup
        backup="$target.bak.$(date +%Y%m%d%H%M%S)"
        mv "$target" "$backup"
        echo "Moved old config to $backup"
    fi
    mkdir -p "$(dirname "$target")"
    ln -s "$source" "$target"
    echo "Linked $target to $source"
}

if [ "${1:-}" != "--config" ]; then
    install_deps
    install_nvim
    install_tree_sitter
fi

link_config

nvim --headless "+Lazy! sync" +qa
echo "Done. $(nvim --version | head -1)"

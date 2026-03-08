#!/bin/bash
# Neovim configuration setup script
# Usage: ./setup.sh

set -e

echo "=== Neovim Config Setup ==="

# Check OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="mac"
else
    echo "Unsupported OS: $OSTYPE"
    exit 1
fi

# Install neovim if not present
if ! command -v nvim &> /dev/null; then
    echo "Installing Neovim..."
    if [[ "$OS" == "linux" ]]; then
        sudo apt-get update && sudo apt-get install -y neovim
    elif [[ "$OS" == "mac" ]]; then
        brew install neovim
    fi
else
    echo "Neovim already installed: $(nvim --version | head -1)"
fi

# Install Node.js (required for coc.nvim)
if ! command -v node &> /dev/null; then
    echo "Installing Node.js..."
    if [[ "$OS" == "linux" ]]; then
        curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
        sudo apt-get install -y nodejs
    elif [[ "$OS" == "mac" ]]; then
        brew install node
    fi
else
    echo "Node.js already installed: $(node --version)"
fi

# Install Rust toolchain (for rust-analyzer)
if ! command -v rustup &> /dev/null; then
    echo "Installing Rust toolchain..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
else
    echo "Rust toolchain already installed: $(rustc --version)"
fi

# Install rust-analyzer
if ! rustup component list --installed | grep -q rust-analyzer; then
    echo "Installing rust-analyzer..."
    rustup component add rust-analyzer
else
    echo "rust-analyzer already installed"
fi

# Install Go language server (gopls)
if command -v go &> /dev/null; then
    if ! command -v gopls &> /dev/null; then
        echo "Installing gopls..."
        go install golang.org/x/tools/gopls@latest
    else
        echo "gopls already installed"
    fi
fi

# Install ccls (C/C++ language server)
if ! command -v ccls &> /dev/null; then
    echo "Installing ccls..."
    if [[ "$OS" == "linux" ]]; then
        sudo apt-get install -y ccls
    elif [[ "$OS" == "mac" ]]; then
        brew install ccls
    fi
else
    echo "ccls already installed"
fi

# Symlink config if cloned elsewhere
NVIM_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$SCRIPT_DIR" != "$NVIM_CONFIG_DIR" ]]; then
    echo "Linking $SCRIPT_DIR -> $NVIM_CONFIG_DIR"
    if [[ -d "$NVIM_CONFIG_DIR" ]]; then
        echo "WARNING: $NVIM_CONFIG_DIR already exists. Back it up first."
        echo "  mv $NVIM_CONFIG_DIR ${NVIM_CONFIG_DIR}.bak"
        exit 1
    fi
    mkdir -p "$(dirname "$NVIM_CONFIG_DIR")"
    ln -s "$SCRIPT_DIR" "$NVIM_CONFIG_DIR"
fi

# Install coc extensions
echo "Installing coc.nvim extensions..."
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions

if [[ ! -f package.json ]]; then
    echo '{"dependencies":{}}' > package.json
fi

npm install --save \
    coc-json \
    coc-tsserver \
    coc-pyright \
    coc-rust-analyzer \
    coc-java \
    coc-go \
    2>/dev/null || true

echo ""
echo "=== Setup complete ==="
echo "Open nvim and lazy.nvim will auto-install plugins on first launch."
echo "Run :checkhealth to verify everything is working."

#!/usr/bin/env bash

set -e

echo "=== Installing Neovim configuration (Linux) ==="

# Paths
CONFIG_DIR="$HOME/.config/nvim"
REPO_DIR="$(dirname "$(realpath "$0")")/nvim"

# 1. Remove old config
if [ -d "$CONFIG_DIR" ]; then
    echo "Removing old configuration..."
    rm -rf "$CONFIG_DIR"
fi

# 2. Create symlink
echo "Creating symlink..."
ln -s "$REPO_DIR" "$CONFIG_DIR"
echo "Symlink created: $CONFIG_DIR -> $REPO_DIR"

# 3. Detect distro
if [ -f /etc/debian_version ]; then
    DISTRO="debian"
elif [ -f /etc/fedora-release ]; then
    DISTRO="fedora"
elif [ -f /etc/arch-release ]; then
    DISTRO="arch"
else
    echo "Unsupported Linux distribution."
    exit 1
fi

echo "Detected distro: $DISTRO"

# 4. Install dependencies
case $DISTRO in
    debian)
        sudo apt update
        sudo apt install -y git ripgrep fd-find fzf neovim python3 python3-pip clangd clang-format
        pip3 install black
        sudo apt install -y stylua || cargo install stylua
        # Fix fd name
        if [ ! -f /usr/local/bin/fd ]; then
            sudo ln -s /usr/bin/fdfind /usr/local/bin/fd
        fi
        ;;
    fedora)
        sudo dnf install -y git ripgrep fd-find fzf neovim python3 python3-pip clang-tools-extra
        pip3 install black
        sudo dnf install -y stylua || cargo install stylua
        ;;
    arch)
        sudo pacman -S --needed --noconfirm git ripgrep fd fzf neovim python python-pip python-black clang stylua
        ;;
esac

# 5. Install Nerd Fonts (JetBrainsMono)
echo "Installing Nerd Fonts (JetBrainsMono)..."
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -fv

echo "=== Installation complete. Launch Neovim. ==="

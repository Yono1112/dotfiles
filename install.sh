#!/bin/bash

DOT_DIR="$HOME/dotfiles"

echo "Dotfiles installation started."

# Neovim
# mkdir -p ~/.config
# ln -sfnv "$DOT_DIR/nvim" "$HOME/.config/nvim"

# Vim
ln -sfnv "$DOT_DIR/vim/vimrc" "$HOME/.vimrc"

# tmux
ln -sfnv "$DOT_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"

# Zsh
ln -sfnv "$DOT_DIR/zsh/zshrc" "$HOME/.zshrc"

# Git
ln -sfnv "$DOT_DIR/git/gitconfig" "$HOME/.gitconfig"


echo "Dotfiles installation completed!"
echo "Please restart your shell (or run 'source ~/.zshrc') to apply changes."

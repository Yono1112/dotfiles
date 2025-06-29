#!/bin/bash
#
# Dotfiles Installer
#
# Creates symlinks for files in this repository to the home directory.
# Backs up any existing files or directories that would be overwritten.
#

# --- Safety Nets ---
# Exit immediately if a command exits with a non-zero status.
# Exit immediately if a pipeline fails.
# Treat unset variables as an error.
set -euo pipefail

# --- Color Definitions ---
if [ -t 1 ]; then
  RESET="\e[0m"
  BOLD="\e[1m"
  RED="\e[31m"
  GREEN="\e[32m"
  YELLOW="\e[33m"
  BLUE="\e[34m"
  MAGENTA="\e[35m"
  CYAN="\e[36m"
else
  RESET=""
  BOLD=""
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  MAGENTA=""
  CYAN=""
fi

# --- Logging Functions (Using printf for portability) ---
msg_info() {
  printf "${BLUE}${BOLD}[INFO]${RESET} %b\n" "$1"
}
msg_success() {
  printf "${GREEN}${BOLD}[SUCCESS]${RESET} %b\n" "$1"
}
msg_warn() {
  printf "${YELLOW}${BOLD}[WARNING]${RESET} %b\n" "$1"
}
msg_error() {
  printf "${RED}${BOLD}[ERROR]${RESET} %b\n" "$1" >&2
  exit 1
}

# --- Main Logic ---

# Get the absolute path to the dotfiles directory.
DOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Creates a symlink for a given file or directory.
# $1: The source path within the dotfiles repository.
# $2: The target path in the home directory.
create_symlink() {
  local source_path="$1"
  local target_path="$2"

  # 1. Check if the source file exists.
  if [ ! -e "$source_path" ]; then
    msg_warn "Source file not found, skipping: $source_path"
    return
  fi

  # 2. Ensure the parent directory of the target exists.
  mkdir -p "$(dirname "$target_path")"

  # 3. Handle existing files at the target location.
  if [ -L "$target_path" ]; then
    # Target is already a symlink.
    if [ "$(readlink "$target_path")" = "$source_path" ]; then
      msg_info "Symlink is already correct: ${CYAN}$target_path${RESET}"
      return
    fi
  elif [ -e "$target_path" ]; then
    # Target is a regular file or directory.
    local backup_path="${target_path}.bak.$(date +%Y%m%d-%H%M%S)"
    msg_warn "Existing file found. Backing up ${YELLOW}$target_path${RESET} to ${YELLOW}$backup_path${RESET}"
    mv "$target_path" "$backup_path"
  fi

  # 4. Create the new symlink.
  ln -sfn "$source_path" "$target_path"
  msg_success "Linked ${CYAN}$target_path${RESET} -> ${MAGENTA}$source_path${RESET}"
}

# --- Main Execution ---

msg_info "Starting dotfiles setup..."
msg_info "Dotfiles directory: ${CYAN}$DOT_DIR${RESET}"
echo "" # Add a newline for spacing.

# List of symlinks to create.
create_symlink "$DOT_DIR/nvim" "$HOME/.config/nvim"
create_symlink "$DOT_DIR/vim/vimrc" "$HOME/.vimrc"
create_symlink "$DOT_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
create_symlink "$DOT_DIR/zsh/zshrc" "$HOME/.zshrc"
create_symlink "$DOT_DIR/git/gitconfig" "$HOME/.gitconfig"

# Conditionally link the .vim directory if it exists.
if [ -d "$DOT_DIR/vim/.vim" ]; then
  create_symlink "$DOT_DIR/vim/.vim" "$HOME/.vim"
fi

echo "" # Add a newline for spacing.
msg_success "Dotfiles setup complete!"

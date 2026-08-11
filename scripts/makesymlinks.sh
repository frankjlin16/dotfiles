#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
backup_dir="$HOME/.dotfiles_old"

link_file() {
  local source="$1"
  local target="$2"

  if [[ ! -e "$source" ]]; then
    printf 'Missing source file: %s\n' "$source" >&2
    exit 1
  fi

  if [[ -L "$target" && "$(readlink "$target")" == "$source" ]]; then
    printf 'Already linked: %s -> %s\n' "$target" "$source"
    return
  fi

  if [[ -e "$target" || -L "$target" ]]; then
    local timestamp backup_name suffix
    timestamp="$(date +%Y%m%d-%H%M%S)"
    backup_name="$backup_dir/$(basename "$target").$timestamp"
    suffix=1

    while [[ -e "$backup_name" || -L "$backup_name" ]]; do
      backup_name="$backup_dir/$(basename "$target").$timestamp.$suffix"
      suffix=$((suffix + 1))
    done

    printf 'Backing up existing: %s -> %s\n' "$target" "$backup_name"
    mv "$target" "$backup_name"
  fi

  printf 'Creating symlink: %s -> %s\n' "$target" "$source"
  ln -s "$source" "$target"
}

mkdir -p "$backup_dir"

# Link only files intended to live directly in the home directory.
link_file "$repo_dir/config/shell/zshrc" "$HOME/.zshrc"
link_file "$repo_dir/config/editor/vimrc" "$HOME/.vimrc"

printf 'Done symlinking.\n'

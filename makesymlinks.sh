#!/usr/bin/env bash
set -euo pipefail

dir="$HOME/dotfiles"        # dotfiles directory
olddir="$HOME/dotfiles_old" # old dotfiles backup directory

# Optional: names to exclude from linking (space-separated)
# e.g., README.md, .git, scripts, etc.
exclude_list=("README" "README.md" "LICENSE" ".git" ".gitignore" ".gitmodules")

echo "Creating backup directory: $olddir"
mkdir -p "$olddir"

echo "Changing to: $dir"
cd "$dir"

# Helper: check if an item is in exclude_list
in_excludes() {
  local item="$1"
  for ex in "${exclude_list[@]}"; do
    if [[ "$item" == "$ex" ]]; then
      return 0
    fi
  done
  return 1
}

# Iterate over non-hidden items in $dir
shopt -s nullglob
for path in "$dir"/*; do
  base="$(basename "$path")"
  
  # Skip excluded names
  if in_excludes "$base"; then
    echo "Skipping excluded: $base"
    continue
  fi

  # Skip files with .sh extension
  if [[ "$base" == *.sh ]]; then
    echo "Skipping .sh file: $base"
    continue
  fi

  target="$HOME/.${base}"

  # If target exists and is already the correct symlink, skip
  if [[ -L "$target" ]]; then
    link_dest="$(readlink "$target" || true)"
    if [[ "$link_dest" == "$path" ]]; then
      echo "Already linked: $target -> $path"
      continue
    fi
  fi

  # If target exists (file, dir, or a different symlink), back it up
  if [[ -e "$target" || -L "$target" ]]; then
    # Unique backup name if one already exists
    ts="$(date +%Y%m%d-%H%M%S)"
    backup_name="$olddir/$(basename "$target").$ts"
    echo "Backing up existing: $target -> $backup_name"
    mv -v "$target" "$backup_name"
  fi

  echo "Creating symlink: $target -> $path"
  ln -s "$path" "$target"
done

echo "Done symlinking."

# Frankie's Dotfiles

Shell and editor configuration for macOS and Linux.

## Prerequisites

Install the following before setup:

- Git
- Zsh
- nvm
- pnpm
- Oh My Posh
- Homebrew

## Setup

1. Clone the repository to the location expected by the installer:

   ```shell
   git clone https://github.com/frankjlin16/dotfiles.git ~/.dotfiles
   ```

2. Enter the repository:

   ```shell
   cd ~/.dotfiles
   ```

3. Make the installer executable:

   ```shell
   chmod +x makesymlinks.sh
   ```

4. Create the symlinks:

   ```shell
   ./makesymlinks.sh
   ```

The script creates `~/.dotfiles_old` and backs up existing dotfiles before replacing them. It links the repository's top-level configuration files into your home directory and skips documentation, Git metadata, and shell scripts.

## Optional: Linux MOTD

On Ubuntu or Debian systems that use `update-motd`, install the custom greeting with:

```shell
sudo install -m 755 \
  ~/.dotfiles/update-motd.d/05-greeting \
  /etc/update-motd.d/05-greeting
```

Test it without logging out:

```shell
/etc/update-motd.d/05-greeting
```

The greeting will appear during the next SSH login or login shell when `update-motd` runs.

## Included

- `zshrc`, linked as `~/.zshrc`
- OS-specific configuration for macOS and Linux
- nvm, pnpm, Homebrew, and Oh My Posh configuration
- `.mytheme.omp.json`, the Oh My Posh theme
- `vimrc`, linked as `~/.vimrc`
- `update-motd.d/05-greeting`, the optional Linux login greeting

## References

- <https://dotfiles.github.io/tutorials/>
- <https://blog.smalleycreative.com/using-git-and-github-to-manage-your-dotfiles/>

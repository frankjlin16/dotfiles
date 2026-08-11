# Frankie's Dotfiles

## Get started

Clone the repository

```shell
git clone https://github.com/frankjlin16/dotfiles.git
```

Run the symlink script

```shell
mv ~/dotfiles ~/.dotfiles
cd ~/.dotfiles
chmod +x makesymlinks.sh
./makesymlinks.sh
```

## Linux MOTD (Ubuntu/Debian)

To install the custom login message, copy the executable script into the dynamic MOTD directory:

```shell
sudo install -m 755 \\
  ~/.dotfiles/update-motd.d/05-greeting \\
  /etc/update-motd.d/05-greeting
```

You can test it without logging out:

```shell
/etc/update-motd.d/05-greeting
```

The message will be displayed on the next SSH login or login shell, provided the system uses `update-motd`.

## Packages Required (from zshrc)

- zsh
- nvm
- pnpm
- Docker Desktop
- Oh My Posh
- vscode shell integration support (`code` command)

## References

- <https://dotfiles.github.io/tutorials/>
- <https://blog.smalleycreative.com/using-git-and-github-to-manage-your-dotfiles/>

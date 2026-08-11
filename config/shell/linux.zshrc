# Linux-specific zsh configuration

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

export YDOTOOL_SOCKET="$HOME/.ydotool_socket"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/fr4nkie/google-cloud-sdk/path.zsh.inc' ]; then . '/home/fr4nkie/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/fr4nkie/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/fr4nkie/google-cloud-sdk/completion.zsh.inc'; fi

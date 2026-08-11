# macOS-specific zsh configuration

# Homebrew
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Added by Antigravity IDE
export PATH="/Users/diode/.antigravity-ide/antigravity-ide/bin:$PATH"

# Added by Antigravity CLI installer
export PATH="$HOME/.local/bin:$PATH"

# lean-ctx shell hook — begin
if [ -f "/Users/diode/.config/lean-ctx/shell-hook.zsh" ]; then
. "/Users/diode/.config/lean-ctx/shell-hook.zsh"
fi
# lean-ctx shell hook — end

# >>> lean-ctx agent aliases >>>
alias claude='LEAN_CTX_AGENT=1 BASH_ENV="$HOME/.bashenv" claude'
alias codebuddy='LEAN_CTX_AGENT=1 BASH_ENV="$HOME/.bashenv" codebuddy'
alias codex='LEAN_CTX_AGENT=1 BASH_ENV="$HOME/.bashenv" codex'
alias gemini='LEAN_CTX_AGENT=1 BASH_ENV="$HOME/.bashenv" gemini'
# <<< lean-ctx agent aliases <<<

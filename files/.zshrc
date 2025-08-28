# Disable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# Colours :3
CYAN='%F{cyan}'             # Cyan
MAGENTA='%F{magenta}'       # Magenta
BRIGHT_BLUE='%F{blue}'      # Bright Blue
RESET='%f'                  # Reset to default

# ZSH prompt
PROMPT="${CYAN}[${MAGENTA}%n@%m${CYAN}] ${BRIGHT_BLUE}%~ ${MAGENTA}%# ${RESET}"

# Add local bin directories to PATH
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
[ -d "/usr/local/bin" ] && export PATH="/usr/local/bin:$PATH"

# Homebrew
if command -v brew &>/dev/null; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

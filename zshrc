HISTSIZE=10000
SAVEHIST=10000
HISTFILE=/home/npokc/.shell-history/.zsh_history
setopt appendhistory
setopt inc_append_history
setopt hist_ignore_all_dups

autoload -U colors && colors

bindkey -e
bindkey ';5D' backward-word # ctrl+left
bindkey ';5C' forward-word  # ctrl+right

zstyle :compinstall filename '/home/npokc/.zshrc'
autoload -Uz compinit
compinit

if [[ -d ~/.local/share/zsh/zsh-syntax-highlighting/ ]]; then
  source ~/.local/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [[ -d ~/.local/share/zsh/zsh-history-substring-search/ ]]; then
  source ~/.local/share/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
fi

# Local binaries
export PATH=/usr/local/bin:${PATH}

echo $PATH

if command -v starship > /dev/null 2>&1; then
  eval "$(starship init zsh)"
elif [ -f ~/.local/bin/starship ]; then
  eval "$(~/.local/bin/starship init zsh)"
fi

export RIPGREP_CONFIG_PATH=~/.ripgreprc

export EDITOR=micro
export BAT_THEME=ansi

alias g='git'
alias ..='cd ..'
alias l='eza --all'
alias ll='eza --long --all --git'

if command --version batcat > /dev/null 2>&1; then
  alias cat='batcat'
fi
if command -v eza > /dev/null 2>&1; then
  alias ls='eza'
fi

export NODE_COMPILE_CACHE=~/.cache/node

echo ".zshrc config is loaded"

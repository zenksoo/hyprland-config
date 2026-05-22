COPILOT=
# Path
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"


# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt histignorealldups   # no duplicate entries
setopt histignorespace     # ignore commands starting with space

# Auto cd
setopt autocd

# Fish-like options
setopt interactive_comments  # allow comments in terminal
setopt correct               # suggest corrections for typos

# Better tab completion (fish-like menu)
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select                     # arrow key menu
zstyle ':completion:*' matcher-list 'm:{a-z}=A-Z'     # case insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # colored completion

# Colored output
alias ls='eza --icons=always'
alias grep='grep --color=auto'
alias ll='eza -lah --icons=always'
alias la='ls -A --color=auto'


# EXPORTS
export EZA_COLORS="*.py=33:di=1;34"

# Fish-like plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# History substring search (like fish, up arrow searches history)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Autosuggestion style (gray like fish)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Prompt (customize this however you like)
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'   # shows git branch

# Git branch function
git_branch() {
  git branch 2>/dev/null | grep '^\*' | sed 's/\* //'
}

# Git status indicator
git_status() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    if [[ -n $(git status --short 2>/dev/null) ]]; then
      echo " ✗"   # dirty
    else
      echo " ✓"   # clean
    fi
  fi
}

setopt PROMPT_SUBST

PROMPT='%F{135}┌─[%f%F{114}%n%f%F{255}@%f%F{75}%m%f%F{255}:%f📁 %F{222}%1~%f%F{203}$([ -n "$(git_branch)" ] && echo " ⎇ $(git_branch)$(git_status)")%f%F{135}]%f
%F{135}└─╼%f '


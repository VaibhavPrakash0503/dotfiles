export PATH="$HOME/.local/bin:$PATH"
# Default editor
export EDITOR="nvim"

# Starship prompt
eval "$(starship init zsh)"

HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_ALL_DUPS     # Don't record duplicate entries(Ignores all duplicates)
setopt HIST_REDUCE_BLANKS       # Remove extra blanks
setopt SHARE_HISTORY            # Share history across sessions
setopt EXTENDED_HISTORY         # Save timestamp info
setopt HIST_SAVE_NO_DUPS        # Don't write duplicates to history file
setopt HIST_EXPIRE_DUPS_FIRST   # Expire duplicates first when trimming

# Ignore common commands
HISTORY_IGNORE="(ls|cd|pwd|exit|clear)"
zshaddhistory() {
  emulate -L zsh
  [[ $1 != ${~HISTORY_IGNORE} ]]
}


# Enable zsh completion system
autoload -Uz compinit
compinit

# Better tab completion behavior
bindkey '^I' expand-or-complete

# Set up zoxide
eval "$(zoxide init zsh)"

# My alias
alias clean='~/.bin/clean.sh'
alias update='~/.bin/update_fedora.sh'
alias git_help='bat ~/.bin/git_help.md'
alias grub_update='sudo grub2-mkconfig -o /boot/grub2/grub'
alias vim='nvim'
alias pfzf='fzf --preview="bat --color=always {}"'
alias nfzf='nvim $(fzf -m --preview="bat --color=always {}")'
alias la='ls -la'
alias suspend='systemctl suspend'
alias cd='z'
alias install='~/.bin/fzf_install.sh'
alias remove='~/.bin/fzf_remove.sh'
alias lzg='lazygit'
alias lzd='lazydocker'

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Start tmux at the start of terminal
if [[ -z "$TMUX" ]]; then
  exec tmux new-session -A -s main
fi

# Auto activate env on cd into directory
eval "$(direnv hook zsh)"

export PATH="$PATH:$HOME/go/bin"

# Set Cursor
# 5 blinking beam
# 6 for steady beam
precmd() {
    echo -ne '\e[6 q'
}

# zsh plugins
source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

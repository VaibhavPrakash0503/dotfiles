export PATH="$HOME/.local/bin:$PATH"

# Starship prompt
eval "$(starship init zsh)"

HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000

setopt INC_APPEND_HISTORY       # Save each command immediately
setopt HIST_IGNORE_DUPS         # Don't record duplicate entries
setopt HIST_REDUCE_BLANKS       # Remove extra blanks
setopt SHARE_HISTORY            # Share history across sessions

# auto cd
setopt auto_cd

# Enable zsh completion system
autoload -Uz compinit
compinit

# Better tab completion behavior
bindkey '^I' expand-or-complete

# Default editor
export EDITOR="nvim"

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
alias netu='~/.bin/wifi_login.sh'
alias netd='~/.bin/wifi_logout.sh'
alias cd='z'
alias install='~/.bin/fzf_install.sh'
alias remove='~/.bin/fzf_remove.sh'
alias lgt='lazygit'
alias ldc='lazydocker'

# Set up fzf key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# zsh plugins
source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh

# jj jujustu VCS setup
# export PATH="$HOME/.cargo/bin:$PATH"
# autoload -U compinit
# compinit
# source <(jj util completion zsh)

# Start tmux at the start of terminal
if [[ -z "$TMUX" ]]; then
  exec tmux new-session -A -s main
fi

# Auto activate env on cd into directory
eval "$(direnv hook zsh)"

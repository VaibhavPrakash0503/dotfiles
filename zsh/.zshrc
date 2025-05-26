# Starship prompt
eval "$(starship init zsh)"

HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=10000

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

# My changes
# ---------------
alias clean="~/.bin/clean.sh"
alias update="~/.bin/update_fedora.sh"
alias git_help="bat ~/.bin/git_help.md"
alias grub_update="sudo grub2-mkconfig -o /boot/grub2/grub"
alias vim="nvim"
alias pfzf='fzf --preview="bat --color=always {}"'
alias nfzf='nvim $(fzf -m --preview="bat --color=always {}")'
alias la="ls -la"
# To make sure the shortcut of fzf works fine
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#if [[ -z "$TMUX" ]]; then
 # exec tmux new-session -A -s main
#fi
# ---------------

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

#plugin
source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh

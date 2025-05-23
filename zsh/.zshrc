eval "$(starship init zsh)"
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# My changes
# ---------------
alias clean="~/.bin/clean.sh"
alias update="~/.bin/update_fedora.sh"
alias git_help="bat ~/.bin/git_help.md"
alias grub_update="sudo grub2-mkconfig -o /boot/grub2/grub"
alias vim="nvim"
alias pfzf='fzf --preview="bat --color=always {}"'
alias nfzf='nvim $(fzf -m --preview="bat --color=always {}")'
# To make sure the shortcut of fzf works fine
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#if [[ -z "$TMUX" ]]; then
 # exec tmux new-session -A -s main
#fi
# ---------------

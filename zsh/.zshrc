# Starship prompt
eval "$(starship init zsh)"

#auto cd
setopt auto_cd
#Default editor
export EDITOR="nvim"

#Set up fzf key bindings and fuzzy completion
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
alias la="ls -la"
# To make sure the shortcut of fzf works fine
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#if [[ -z "$TMUX" ]]; then
 # exec tmux new-session -A -s main
#fi
# ---------------

#plugins

source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh

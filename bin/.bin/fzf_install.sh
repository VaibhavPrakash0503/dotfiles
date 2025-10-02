#!/usr/bin/env bash

# DNF searcher in tmux floating window
tmux display-popup -E -h 70% -w 60% -x C -y C "
  dnf list --available --quiet | awk '{print \$1}' | sed 's/\\..*$//' | sort -u | fzf --print-query \
      --bind='change:reload(if [ {q} ]; then dnf list --available --quiet | awk \"{print \\\$1}\" | sed \"s/\\..*$//\" | grep -i {q} | sort -u; else dnf list --available --quiet | awk \"{print \\\$1}\" | sed \"s/\\..*$//\" | sort -u; fi)' \
      --bind='enter:execute(echo {} | xargs -r sudo dnf install -y)+abort' \
      --preview='if [ {} ]; then dnf info {} 2>/dev/null; fi' \
      --preview-window='down:50%' \
      --border='rounded' \
      --height='100%'
"

#!/usr/bin/env bash

# DNF searcher in tmux floating window

tmux display-popup -E -h 70% -w 60% -x C -y C "
  printf 'firefox\ngit\nneovim\nhtop\nchrome\ncode\nnodejs\npython3\nrust\n' | fzf --print-query \
      --bind='change:reload(if [ {q} ]; then dnf search {q} 2>/dev/null | grep \"^[^=]\" | head -50 | awk \"{print \\\$1}\" | sed \"s/\\\\..*//\"; else printf \"firefox\\\\ngit\\\\nvim\\\\nhtop\\\\nchrome\\\\ncode\\\\ndocker\\\\nnodejs\\\\npython3\\\\nrust\\\\n\"; fi)' \
      --bind='enter:execute(echo {} | xargs -r sudo dnf install -y)+abort' \
      --preview='if [ {} ]; then dnf info {} 2>/dev/null; fi' \
      --preview-window='down:50%' \
      --border='rounded' \
      --height='100%'
"

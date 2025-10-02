#!/usr/bin/env bash

# DNF package remover - simplified (like your install script)

tmux display-popup -E -h 70% -w 60% -x C -y C "
  rpm -qa --qf '%{NAME}\n' | grep -v -E '^(lib|font|glibc|kernel|systemd|dbus|NetworkManager|grub|dracut)' | grep -v -E '(devel|debug|doc|lang|headers)\$' | sort | head -20 | fzf --print-query \
      --prompt='Remove packages: ' \
      --header='Type to search | Enter to remove' \
      --bind='change:reload(if [ {q} ]; then rpm -qa --qf \"%{NAME}\\n\" | grep -i {q} | grep -v -E \"^(lib|font|glibc|kernel|systemd|dbus|NetworkManager|grub|dracut)\" | grep -v -E \"(devel|debug|doc|lang|headers)\\$\" | sort; else rpm -qa --qf \"%{NAME}\\n\" | grep -v -E \"^(lib|font|glibc|kernel|systemd|dbus|NetworkManager|grub|dracut)\" | grep -v -E \"(devel|debug|doc|lang|headers)\\$\" | sort | head -20; fi)' \
      --bind='enter:execute(echo {} | xargs -r sudo dnf remove -y)+abort' \
      --preview='if [ {} ]; then dnf info {} 2>/dev/null; fi' \
      --preview-window='down:50%' \
      --border='rounded' \
      --height='100%'
"

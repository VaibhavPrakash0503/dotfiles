#!/usr/bin/env bash

# Combined package remover
tmux display-popup -E -h 70% -w 60% -x C -y C "
  (rpm -qa --qf '%{NAME}\t[rpm]\n' \
    | grep -v -E '^(lib|font|glibc|kernel|systemd|dbus|NetworkManager|grub|dracut)' \
    | grep -v -E '(devel|debug|doc|lang|headers)\$'; \
    flatpak list --app --columns=application \
    | sed 's/$/\t[flatpak]/') | sort | fzf --print-query --with-nth=1 --delimiter='\t' \
      --bind='change:reload(if [ {q} ]; then (rpm -qa --qf \"%{NAME}\t[rpm]\n\" \
      | grep -i {q} | grep -v -E \"^(lib|font|glibc|kernel|systemd|dbus|NetworkManager|grub|dracut)\" \
      | grep -v -E \"(devel|debug|doc|lang|headers)\$\"; flatpak list --app --columns=application \
      | grep -i {q} | sed \"s/$/\t[flatpak]/\") | sort; else (rpm -qa --qf \"%{NAME}\t[rpm]\n\" \
      | grep -v -E \"^(lib|font|glibc|kernel|systemd|dbus|NetworkManager|grub|dracut)\" \
      | grep -v -E \"(devel|debug|doc|lang|headers)\$\"; flatpak list --app --columns=application \
      | sed \"s/$/\t[flatpak]/\") | sort; fi)' \
      --bind='enter:execute(if [[ {2} == \"[flatpak]\" ]]; then flatpak uninstall -y --delete-data {1}; \
    else sudo dnf remove -y {1}; fi)+abort' \
      --preview='if [[ {2} == \"[flatpak]\" ]]; then flatpak info {1} 2>/dev/null; else dnf info {1} 2>/dev/null; fi' \
      --preview-window='down:50%' \
      --border='rounded' \
      --height='100%'
"

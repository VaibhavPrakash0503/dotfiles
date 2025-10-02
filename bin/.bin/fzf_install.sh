#!/usr/bin/env bash

tmux display-popup -E -h 70% -w 60% -x C -y C "
  (dnf list --available --quiet \
    | awk '{print \$1}' \
    | sed 's/\\..*\$//' \
    | grep -v -E '^(lib|glibc|kernel|systemd|dbus|grub|dracut|font|NetworkManager)' \
    | grep -v -E '(devel|debug|debuginfo|doc|lang|headers|common|data|libs?)\$' \
    | sed 's/\$/\\t[rpm]/' \
    | sed 's/\$/\\t[rpm]/' | head -200;

   flatpak remote-ls flathub --app --columns=application \
   | sed 's/\$/\\t[flatpak]/' | head -200) \
   | sort | fzf --with-nth=1 --delimiter='\t' \
      --bind='change:reload(
        if [ {q} ]; then
          (dnf list --available --quiet | awk \"{print \\\$1}\" | sed \"s/\\..*\$//\" | grep -i {q} | sed \"s/\$/\\t[rpm]/\"; \
           flatpak remote-ls flathub --app --columns=application | grep -i {q} | sed \"s/\$/\\t[flatpak]/\") | sort;
        else
          (dnf list --available --quiet | awk \"{print \\\$1}\" | sed \"s/\\..*\$//\" | sed \"s/\$/\\t[rpm]/\" | head -200; \
           flatpak remote-ls flathub --app --columns=application | sed \"s/\$/\\t[flatpak]/\" | head -200) | sort;
        fi)' \
      --bind='enter:execute(
        if [[ {2} == \"[flatpak]\" ]]; then
          flatpak install -y flathub {1};
        else
          sudo dnf install -y {1};
        fi
      )+abort' \
      --preview='if [[ {2} == \"[flatpak]\" ]]; then flatpak remote-info flathub {1} 2>/dev/null; else dnf info {1} 2>/dev/null; fi' \
      --preview-window='down:50%' \
      --border='rounded' \
      --height='100%'
"

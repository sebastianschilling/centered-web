#!/bin/sh
# Veröffentlicht NUR den Ordner web/ in das öffentliche Repo centered-web.
# git subtree überträgt ausschließlich die Historie dieses Unterordners – der
# App-Quellcode aus ios/ bleibt im privaten Repo.
#
# Einmalig vorher:
#   git remote add centered-web git@github.com:sebastianschilling/centered-web.git
set -eu

root=$(git rev-parse --show-toplevel)
cd "$root"

# Die Platzhalter sind der Grund, warum dieses Skript existiert: Eine Seite ohne
# ladungsfähige Anschrift darf nicht online gehen. Nur die HTML-Seiten prüfen: README und
# dieses Skript nennen das Wort selbst und würden sonst jeden Lauf blockieren.
if grep -lE 'AUSFÜLLEN|class="todo"' web/*.html >/dev/null 2>&1; then
  echo "Abbruch: In web/ stehen noch Platzhalter." >&2
  grep -nE 'AUSFÜLLEN|class="todo"' web/*.html | sed 's/^/  /' >&2
  exit 1
fi

if [ -n "$(git status --porcelain web)" ]; then
  echo "Abbruch: web/ hat uncommittete Änderungen – erst committen." >&2
  exit 1
fi

git subtree push --prefix=web centered-web main
echo "Fertig. Live in ein bis zwei Minuten: https://centered.sebastianschilling.com/"

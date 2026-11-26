#!/bin/sh
# Installs Perch, a small Mac app: https://galcabinet.github.io/perch
set -e
[ "$(uname)" = "Darwin" ] || { echo "Perch is a Mac app." >&2; exit 1; }
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
echo "Downloading Perch"
curl -fsSL "https://github.com/galcabinet/perch/releases/latest/download/Perch.zip" -o "$TMP/Perch.zip"
ditto -x -k "$TMP/Perch.zip" "$TMP"
DEST="/Applications"
[ -w "$DEST" ] || { DEST="$HOME/Applications"; mkdir -p "$DEST"; }
pkill -x Perch 2>/dev/null || true
rm -rf "$DEST/Perch.app"
mv "$TMP/Perch.app" "$DEST/Perch.app"
open "$DEST/Perch.app"
echo "Perch is in $DEST. It is open now."

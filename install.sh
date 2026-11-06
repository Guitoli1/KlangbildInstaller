#!/bin/bash
# Klangbild – alle Plugins installieren (Audio Unit + VST3)
# Aufruf im Terminal:
#   curl -fsSL https://raw.githubusercontent.com/Guitoli1/KlangbildInstaller/main/install.sh | bash
set -euo pipefail

URL="https://github.com/Guitoli1/KlangbildInstaller/releases/latest/download/Klangbild-Plugins.zip"
AU_DIR="$HOME/Library/Audio/Plug-Ins/Components"
VST3_DIR="$HOME/Library/Audio/Plug-Ins/VST3"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "🎛  Klangbild – Plugins werden geladen …"
curl -fL --progress-bar "$URL" -o "$TMP/plugins.zip"

echo "📦 Entpacken …"
ditto -x -k "$TMP/plugins.zip" "$TMP/payload"

if pgrep -xq "Logic Pro X" || pgrep -xq "Logic Pro"; then
    echo "⚠️  Logic Pro läuft gerade – bitte nach der Installation neu starten."
fi

mkdir -p "$AU_DIR" "$VST3_DIR"
count=0
for src in "$TMP/payload/Components/"*.component; do
    name="$(basename "$src")"
    rm -rf "$AU_DIR/$name"
    ditto "$src" "$AU_DIR/$name"
    xattr -dr com.apple.quarantine "$AU_DIR/$name" 2>/dev/null || true
    echo "   ✓ $name"
    count=$((count + 1))
done
for src in "$TMP/payload/VST3/"*.vst3; do
    name="$(basename "$src")"
    rm -rf "$VST3_DIR/$name"
    ditto "$src" "$VST3_DIR/$name"
    xattr -dr com.apple.quarantine "$VST3_DIR/$name" 2>/dev/null || true
done

# macOS die neuen Audio Units sofort bekannt machen
killall -9 AudioComponentRegistrar 2>/dev/null || true

echo
echo "✅ Fertig: $count Klangbild-Plugins installiert (Audio Unit + VST3)."
echo "   Logic Pro (neu) starten → Audio Units → Klangbild."

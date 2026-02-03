#!/bin/bash
INSTALL_DIR="$HOME/.local/bin"
TMP_DIR="$(mktemp -d)"
REPO_URL="https://github.com/miroslavberezin93-blip/croman.git"

git clone "$REPO_URL" "$TMP_DIR" || { echo "Failed to clone repo"; exit 1; }
BIN_SOURCE="$TMP_DIR/build/croman"

if [ ! -f "$BIN_SOURCE" ]; then
    echo "Error: $BIN_SOURCE not found in repo."
    exit 1
fi

mkdir -p "$INSTALL_DIR"
cp "$BIN_SOURCE" "$INSTALL_DIR/croman"
chmod +x "$INSTALL_DIR/croman"

if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> "$HOME/.bashrc"
    echo "Added $INSTALL_DIR to PATH. Run 'source ~/.bashrc' or open a new terminal."
fi

rm -rf "$TMP_DIR"
echo "croman installed!"

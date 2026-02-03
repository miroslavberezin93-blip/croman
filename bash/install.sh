#!/bin/bash

REPO_URL="https://github.com/miroslavberezin93-blip/croman"
INSTALL_DIR="$HOME/.local/bin"
TMP_DIR="$(mktemp -d)"

echo "Installing croman..."

git clone "$REPO_URL" "$TMP_DIR" || { echo "Failed to clone repository"; exit 1; }

cd "$TMP_DIR/src" || { echo "Cannot find src folder"; exit 1; }
gcc croman.c -o croman || { echo "Compilation failed"; exit 1; }

mkdir -p "$INSTALL_DIR"

cp croman "$INSTALL_DIR"
chmod +x "$INSTALL_DIR/croman"

if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> "$HOME/.bashrc"
    echo "Added $INSTALL_DIR to PATH. Run 'source ~/.bashrc' to apply."
fi

rm -rf "$TMP_DIR"

echo "croman installed! You can now run 'croman' from any terminal."

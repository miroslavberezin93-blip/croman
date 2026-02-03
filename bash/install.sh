#!/bin/bash
INSTALL_DIR="$HOME/.local/bin"
BIN_SOURCE="./build/croman"
echo "Installing croman..."
if [ ! -f "$BIN_SOURCE" ]; then
    echo "Error: $BIN_SOURCE not found."
    exit 1
fi
mkdir -p "$INSTALL_DIR"
cp "$BIN_SOURCE" "$INSTALL_DIR/croman"
chmod +x "$INSTALL_DIR/croman"
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> "$HOME/.bashrc"
    echo "Added $INSTALL_DIR to PATH. Run 'source ~/.bashrc' or open a new terminal."
fi
echo "croman installed!"
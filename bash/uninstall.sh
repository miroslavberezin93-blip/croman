#!/bin/bash
INSTALL_DIR="$HOME/.local/bin"
BIN="$INSTALL_DIR/croman"

if [ -f "$BIN" ]; then
    rm "$BIN"
    echo "Removed $BIN"
else
    echo "$BIN not found"
fi

if grep -q "$INSTALL_DIR" "$HOME/.bashrc"; then
    sed -i "\|$INSTALL_DIR|d" "$HOME/.bashrc"
    echo "Removed $INSTALL_DIR from PATH in ~/.bashrc"
    echo "Run 'source ~/.bashrc' or open a new terminal to apply changes"
fi

echo "croman uninstalled!"

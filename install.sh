#!/usr/bin/env bash
# Script for system-wide coffee installation
set -e

COFFEE_ROOT=${COFFEE_ROOT:-$HOME/.coffee}
SRC_DIR=./src/

# Create installation directory structure
mkdir -p "$COFFEE_ROOT/bin" "$COFFEE_ROOT/lib"

llc "$SRC_DIR/coffee.ll" -o coffee.s
gcc coffee.s -o coffee

cp "$SRC_DIR/syntax.txt" "$COFFEE_ROOT/bin"
mv coffee "$COFFEE_ROOT/bin"

echo "Installation completed!"

warn() {
 echo ""
 echo ""
 echo "WARNING: seems like '$COFFEE_ROOT/bin' is not in \$PATH. Add the following to your shell init file:"
 echo ""
 echo " export PATH=\"\$PATH:$COFFEE_ROOT/bin\""
 echo ""
 echo "Thanks <3"
 echo ""
}

[[ ! -z "$(which coffee)" ]] && warn

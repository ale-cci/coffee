#!/usr/bin/env bash

# Script for system-wide coffee installation
export COFFEE_ROOT=${COFFEE_ROOT:-$HOME/.coffee}
ROOT=$(dirname $0)
SRC_DIR="$ROOT/src/"

# Feel free to customize c compiler at your needs
CC="${CC:-cc}"
C_FLAGS="${C_FLAGS:- -Wall -O2}"


install-lib() {
    echo " . Installing standard libraries"
    pushd "$SRC_DIR" >/dev/null
    # Cleanup std directory
    rm -rf "${COFFEE_ROOT}/lib/"*
    find std -name '*.bn' -not -name '*.test.bn' \
        -exec bash -c 'mkdir -p $(dirname "${COFFEE_ROOT}/lib/{}") && cp "{}" "${COFFEE_ROOT}/lib/{}"' \;
    popd >/dev/null
    return 0
}

install-coffee() {
    echo " . Building coffee"
    llc "$SRC_DIR/coffee.ll" -o coffee.s || return 1
    cc $CFLAGS coffee.s -o coffee || return 1
    rm coffee.s
    mv coffee "$COFFEE_ROOT/bin"
    return 0
}

_main() {
    # Create installation directory structure
    mkdir -p "$COFFEE_ROOT/bin" "$COFFEE_ROOT/lib"
    install-lib
    install-coffee || warn-installation-failure
    [[ -z "$(which coffee)" ]] && warn-coffee-not-in-path
    echo " ☕ coffee is ready!"
}

warn-coffee-not-in-path() {
 echo ""
 echo ""
 echo "WARNING: seems like '$COFFEE_ROOT/bin' is not in \$PATH. Add the following to your shell init file:"
 echo ""
 echo " export PATH=\"\$PATH:$COFFEE_ROOT/bin\""
 echo ""
 echo "Thanks <3"
 echo ""
}

warn-installation-failure() {
    echo "Installation interrupted"
    exit 1
}

_main

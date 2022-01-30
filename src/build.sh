#!/usr/bin/env bash
case $1 in

    clean)
        rm -f *.ll *.s run a.out a.out.ll a.out.s
        ;;

    install)
        # 1. compile the project
        $0 build
        # 2. move in $PATH output (see install command)
        echo "feature not implemented yet"
        ;;

    *)
        coffee -in main.bn -out run
        ;;
esac

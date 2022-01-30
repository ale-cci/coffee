#!/usr/bin/env bash
case $1 in
    clean) rm -f *.ll *.s run a.out a.out.ll a.out.s ;;
    install) echo "TODO!" ;;

    *)
        coffee -in main.bn -out run
        ;;
esac

#!/usr/bin/env sh

vasm -dotdir -Fbin -cbm-prg life.a -L life.lst -o life.prg

if [ $? -eq 0 ]; then
    echo "Load labels into x64"
    symbols_to_add_label.py < life.lst > life.lbl
    echo "load_labels \"$(pwd)/life.lbl\"" | nc localhost 6510
fi

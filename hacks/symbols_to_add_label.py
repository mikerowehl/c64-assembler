#!/usr/bin/env python3

import fileinput
import re

in_symbols = False

print("clear_labels")
for line in fileinput.input():
    if in_symbols:
        if not line.strip():
            in_symbols = False
        else:
            sym = re.search(r'^(\w+) ',line).group(1)
            addr = re.search(r'=0x(\w+)\)',line).group(1)
            print(f"add_label ${addr} .{sym}")
    if line.startswith("Symbols:"):
        in_symbols = True

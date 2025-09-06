#!/usr/bin/python3
# Merci Moonz ! http://linuxfr.org/comments/851709.html#851709
# version gawk (par Putifuto) : gawk '/->/ { z=$0} /[0-9]+[^->]/ {print z$0}' FIC.txt
# version gawk (par Snarky) : awk -F';' '!/[0-9]/{print $0}/->/{a=$0}/[0-9]+[^->]/{for(x=1;x<NF;x++)print a$x";"}' src.txt

import sys

# Read input from stdin
input_data = sys.stdin.read()

i = "0"
for line in input_data.splitlines():
    if "->" in line:
        i = line.split("->")[0].strip()
    elif ';' in line:
        for j in line.split(";"):
            if j.strip():
                print(f"{i}->{j.strip()}")
    else:
        print(line)
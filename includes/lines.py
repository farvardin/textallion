#!/usr/bin/python2
# Merci Moonz ! http://linuxfr.org/comments/851709.html#851709
# http://linuxfr.org/nodes/51351/comments/851709#851709
# version gawk (par Putifuto) : gawk '/->/ { z=$0} /[0-9]+[^->]/ {print z$0}' FIC.txt
# version gawk (par Snarky) : awk -F';' '!/[0-9]/{print $0}/->/{a=$0}/[0-9]+[^->]/{for(x=1;x<NF;x++)print a$x";"}' src.txt

import sys
input = sys.stdin.read()

i = "0"
for line in input.splitlines():
        if "->" in line:
                i = line.split("->")[0]
        elif ';' in line:
                for j in line.split(";"):
                        if j.strip():
                                print "%s->%s"% (i, j)
        else:
                print line
		

#!/usr/bin/python2
# Merci Moonz ! http://linuxfr.org/comments/851709.html#851709


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
		

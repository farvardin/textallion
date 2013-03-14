#!/usr/bin/env bash

# this script will convert from twee to textallion
# it's still not perfect yet (don't use spaces in your passage labels)
# [i] & [b] are probably useless (TODO)

cat $1 \
| sed 's/\x0D$//' \
| perl -pe "s/:: (.*)/== \1 ==\[\1\]\n/g" \
| perl -pe "s/\[i\]/\/\//g" \
| perl -pe "s/\[\/i\]/\/\//g" \
| perl -pe "s/\[b\]/**/g" \
| perl -pe "s/\[\/b\]/**/g" \
| perl -pe "s/\[\[(\d+)\]\]/\1/g" \
| perl -pe "s/\[\[(.*?)\]\]/\[\1 #\1\]/g" \
> $1_export.t2t

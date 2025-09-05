#!/usr/bin/env bash

export TEXTALLIONDOC=examples
make html
make pdf
export TEXTALLIONDOC=sample_cyoa
make cyoa-html
make cyoa-pdf
export TEXTALLIONDOC=exemple_lettre 
make lettre

rm -fr *toc *out *log *aux *idx *tns *ilg *ind
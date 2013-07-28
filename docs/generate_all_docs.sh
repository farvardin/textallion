#!/bin/sh

# Generates lots of errors, will be made in a makefile maybe in the future...

export TEXTALLIONFOLDER="../"
export TXT2TAGS="python2 ../contrib/txt2tags/txt2tags"

rm -fr /tmp/textallion
mkdir -p /tmp/textallion/docs
mkdir -p /tmp/textallion/samples
mkdir -p /tmp/textallion/samples_cyoa

# French docs
export DOCLANG=fr
export TEXTALLIONDOC=documentation_fr
make epub
make pdf
make html
make slidy
ebook-meta the_blue_death.epub --title "Textallion - Documentation" --authors "Eric Forgeot" --language "fr" --tags "textallion" 
export TEXTALLIONDOC=textallion_cyoa_fr
make pdf
make html
make clean
mv *.html /tmp/textallion/docs
mv *.pdf /tmp/textallion/docs
mv *.epub /tmp/textallion/docs

# English docs
export DOCLANG=en
export TEXTALLIONDOC=documentation_en
make epub
make pdf
make html
make slidy
ebook-meta the_blue_death.epub --title "Textallion - Documentation" --authors "Eric Forgeot" --language "en" --tags "textallion" 
export TEXTALLIONDOC=textallion_cyoa_en
make pdf
make html
make clean
mv *.html /tmp/textallion/docs
mv *.pdf /tmp/textallion/docs
mv *.epub /tmp/textallion/docs

# Quickref doc
$TXT2TAGS -T $TEXTALLIONFOLDER/templates/xhtml.html -t xhtml --outfile quickref.html quickref.t2t
$TXT2TAGS -T $TEXTALLIONFOLDER/templates/latex_no_title.tex -t tex --outfile quickref.tex quickref.t2t
# sed -n 'H;${g;s/\\maketitle\n\\clearpage//g;p}' quickref.tex > quickref2.tex
# mv -f quickref2.tex quickref.tex
pdflatex -interaction batchmode quickref.tex
mv *.html /tmp/textallion/docs
mv *.pdf /tmp/textallion/docs
rm -fr quickref.tex
make clean

$TXT2TAGS -T $TEXTALLIONFOLDER/templates/xhtml.html presentation.t2t 


mv *.html /tmp/textallion/docs

make clean-everything

cp ../includes/sample.css /tmp/textallion/samples
cp -fr ../includes /tmp/textallion
cp -fr ../templates /tmp/textallion
cp -fr ../media /tmp/textallion

# sample
cd ../samples/
export TEXTALLIONDOC=examples

make epub
make pdf
make html
make slidy
make clean
ebook-meta the_blue_death.epub --title "Textallion - Samples" --authors "Eric Forgeot" --language "en" --tags "textallion" 
mv *.html /tmp/textallion/samples
mv *.pdf /tmp/textallion/samples
mv *.epub /tmp/textallion/samples

## txt2cyoa examples

cd ../samples_cyoa
cp *.jpg /tmp/textallion/samples_cyoa

# Un nouveau monde
export DOCLANG=fr
export TEXTALLIONDOC=un_nouveau_monde_gbl
make cyoa-epub
make cyoa-pdf
make cyoa-html
make clean
mv *.html /tmp/textallion/samples_cyoa
mv *.pdf /tmp/textallion/samples_cyoa
mv *.epub /tmp/textallion/samples_cyoa

# La mort bleue
export TEXTALLIONDOC=la_mort_bleue
make cyoa-epub
make cyoa-pdf
make cyoa-html
make clean
ebook-meta the_blue_death.epub --title "La Mort Bleue" --authors "Otto Grimwald" --language "fr" --tags "cyoa, ldvelh" 
mv *.html /tmp/textallion/samples_cyoa
mv *.pdf /tmp/textallion/samples_cyoa
mv *.epub /tmp/textallion/samples_cyoa

# The blue death
export DOCLANG=en
export TEXTALLIONDOC=the_blue_death
make cyoa-epub
make cyoa-pdf
make cyoa-html
make clean
ebook-meta the_blue_death.epub --title "The Blue Death" --authors "Otto Grimwald" --language "en" --tags "cyoa" 
mv *.html /tmp/textallion/samples_cyoa
mv *.pdf /tmp/textallion/samples_cyoa
mv *.epub /tmp/textallion/samples_cyoa

# other actions
$TXT2TAGS readme.t2t
cp ../README.txt /tmp/textallion/

make clean-everything

echo -e "\n\nEverything was copied into /tmp/textallion"



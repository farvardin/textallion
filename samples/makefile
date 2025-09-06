# Makefile for Textallion
# Tiny almost-Kiss Word Processor
# http://anamnese.online.fr/site2/textallion/docs/presentation.html
# License: http://en.wikipedia.org/wiki/BSD_licenses
#
# get newest textallion at https://textallion.sourceforge.io
#
# This is a Makefile for *GNU make*, the default for Linux.
# On *BSD systems, you'll need to use "gmake" instead of "make"

# Makefile initially generated on xx DOCUMENT DATE xx


export TEXTALLIONFOLDER = ../
# <!> keep /usr/share/textallion if it is written so!


#TXT2TAGS = python2 $(TEXTALLIONFOLDER)/contrib/txt2tags/txt2tags
export TXT2TAGS = python3 $(TEXTALLIONFOLDER)/contrib/txt2tags/txt2tags3

ifdef TEXTALLIONDOC
  export DOCUMENT = $(TEXTALLIONDOC)
else
  DOCUMENT = examples
  #DOCUMENT = template
  #DOCUMENT = sample
  #DOCUMENT = exemple_lettre
endif



DOCUMENT_TITLE = xx DOCUMENT TITLE xx
DOCUMENT_AUTHOR = xx DOCUMENT AUTHOR xx
DOCUMENT_TAGS = xx DOCUMENT TAGS xx
DOCUMENT_IFID = xx DOCUMENT IFID xx
DOCUMENT_INFO = textallion - https://textallion.sourceforge.io

ifdef DOCLANG
  DOCUMENT_LANGUAGE = $(DOCLANG)
else
  DOCUMENT_LANGUAGE = xx DOCUMENT LANGUAGE xx 
endif

#DOCUMENT_COVER = $(TEXTALLIONFOLDER)/media/sample_cover.png
DOCUMENT_COVER = $(DOCUMENT).jpg

PDFREADER = xdg-open
EPUBREADER = ebook-viewer 
HTMLREADER = firefox
DIFFTOOL = meld
RENPY = /opt/renpy/renpy.sh




UNAME := $(shell uname)

ifeq ($(UNAME), Darwin)
	EDITTOOL = open
else
#	EDITTOOL = gvim
	EDITTOOL = geany
#	EDITTOOL = vim
#   	EDITTOOL = nano
#	EDITTOOL = SciTE
endif




info:
	printf "make: +  \n all \n beamer \n booklet \n clean \n cleanall \n clean-everything \n configuration-update \n cover \n cyoa-epub \n cyoa-gbl \n cyoa-graph \n cyoa-html \n cyoa-hyena \n cyoa-inform7 \n cyoa-pdf \n cyoa-play \n cyoa-ramus \n cyoa-renpy \n cyoa-togbl \n cyoa-twee \n cyoa-txt \n edit \n epub \n html \n htmlhandhelds \n info \n makefile \n pdf \n pdfsmall \n read \n readepub \n readhtml \n readindex \n readpdf \n slidy \n split \n tidy \n txt \n vignettes \n website \n xetex \n \n" 
	
all:    epub html pdf website clean


rightsweb:
	chown -R www-data:www-data ./


#distrib: html clean
#	-rm $(DOCUMENT).zip
#	-rm -fr $(DOCUMENT)
#	-mkdir $(DOCUMENT)
#	-cp * $(DOCUMENT)
#	zip $(DOCUMENT).zip -r $(DOCUMENT) -x $(DOCUMENT).zip

html:
	$(TXT2TAGS) -T $(TEXTALLIONFOLDER)/templates/xhtml.html -t xhtml --css-inside --css-sugar --toc --outfile $(DOCUMENT).html $(DOCUMENT).t2t

htmlhandhelds:
	$(TXT2TAGS) -t xhtml --no-style  --style=$(TEXTALLIONFOLDER)/includes/sample_handheld.css --toc --outfile $(DOCUMENT).html $(DOCUMENT).t2t

edit:
	$(EDITTOOL) $(DOCUMENT).t2t &
txt:
	$(TXT2TAGS) --no-headers -t txt $(DOCUMENT).t2t

pdf:
	$(TXT2TAGS) -T $(TEXTALLIONFOLDER)/templates/latex.tex -t tex --toc --outfile $(DOCUMENT).tex $(DOCUMENT).t2t
ifeq ($(DOCUMENT_LANGUAGE),en)
	sed -i -e "s/,frenchb,francais//g" $(DOCUMENT).tex
endif
	-pdflatex -interaction batchmode $(DOCUMENT).tex
	-makeindex $(DOCUMENT).idx
	-pdflatex -interaction batchmode $(DOCUMENT).tex
	# (the compilation of the latex document is duplicated so the TOC generated the first time will be included the second time)
	-pdflatex -interaction batchmode $(DOCUMENT).tex
	# and one again because of makeindex
	

pdfweb: 
	make html
	wkhtmltopdf --page-size A4 --margin-top 1.0cm --margin-bottom 1.0cm --margin-left 0.5cm --margin-right 0.5cm $(DOCUMENT).html $(DOCUMENT).pdf

pdfwk:
	make pdfweb

pdfnolatex:
	make pdfweb


xetex:
	$(TXT2TAGS) -T $(TEXTALLIONFOLDER)/templates/xetex.tex -t tex --toc --outfile $(DOCUMENT).tex $(DOCUMENT).t2t
ifeq ($(DOCUMENT_LANGUAGE),en)
	sed -i -e "s/,frenchb,francais//g" $(DOCUMENT).tex
endif
	-xelatex -interaction batchmode $(DOCUMENT).tex
	-xelatex -interaction batchmode $(DOCUMENT).tex

latex:
	make pdf
	

lettre:
	$(TXT2TAGS) -T $(TEXTALLIONFOLDER)/templates/lettre.tex -t tex --no-toc --outfile $(DOCUMENT).tex $(DOCUMENT).t2t
	-pdflatex -interaction batchmode $(DOCUMENT).tex
	-make clean

lettre-1page:
	pdfjam $(DOCUMENT).pdf '1' --outfile $(DOCUMENT)b.pdf 
	mv $(DOCUMENT)b.pdf $(DOCUMENT).pdf 
	
readpdf:	
	$(PDFREADER) $(DOCUMENT).pdf &

readhtml:	
	$(HTMLREADER) $(DOCUMENT).html &

readindex:	
	$(HTMLREADER) index_$(DOCUMENT).html &

readepub:	
	$(EPUBREADER) $(DOCUMENT).epub &

read:
	make readpdf &

pdfsmall: pdf
	-pdfnup $(DOCUMENT).pdf --nup 2x1

booklet: pdf
	-pdf2ps $(DOCUMENT).pdf
	-psbook $(DOCUMENT).ps | psnup -2 > $(DOCUMENT)_booklet.ps
	-ps2pdf $(DOCUMENT)_booklet.ps


slidy: 
	$(TXT2TAGS) -C $(TEXTALLIONFOLDER)/templates/slidy.conf.t2t -T $(TEXTALLIONFOLDER)/templates/slidy -t xhtml --css-inside -o $(DOCUMENT)_slide.html $(DOCUMENT).t2t

beamer: 
	$(TXT2TAGS) --no-style --no-infile -C $(TEXTALLIONFOLDER)/templates/beamer.conf.t2t -C $(TEXTALLIONFOLDER)/core/textallion_beamer.t2t -T $(TEXTALLIONFOLDER)/templates/beamer -t tex -o $(DOCUMENT)_slide.tex $(DOCUMENT).t2t
	pdflatex $(DOCUMENT)_slide.tex
	
	
# uses html tidy

tidy:
	-tidy -asxhtml --tidy-mark 1 --wrap 0 --clean 1 --output-xhtml 1 --input-encoding utf8 --doctype strict --new-inline-tags video,audio,canvas  $(DOCUMENT).html > $(DOCUMENT)2.html
	cat $(DOCUMENT)2.html | sed -e "s/<meta name=\"generator\" content=\"http:\/\/txt2tags.org\" \/>//g" | sed -e "s/border=\"0\"//g" | sed -e "s/lang=\"fr\"//g" | sed -e "s/border=\"0\"//g" | sed -e "s/<\?xml version=\"1.0\" encoding=\"utf8\"\?>//g" | sed -e "s/name=\"toc[0-9]\"//g"> $(DOCUMENT).html

# uses calibre

	
epub:
	$(TXT2TAGS) -T $(TEXTALLIONFOLDER)/templates/epub.html -t xhtml --no-style --no-toc --outfile $(DOCUMENT).html $(DOCUMENT).t2t
	cat $(DOCUMENT).html | sed -e "s/<audio\(.*\)audio>//g" > $(DOCUMENT)2.html
	mv $(DOCUMENT)2.html $(DOCUMENT).html
	-make tidy
	cat $(DOCUMENT).html | sed -e "s/&#10086;/*/g" | sed -e "s/&#10087;/*/g" | sed -e "s/&#10037;/*/g" | sed -e "s/&#9788;/*/g" | sed -e "s/&#9789;/*/g" | sed -e "s/&#9790;/*/g" | sed -e "s/&#9675;/*/g" | sed -e "s/html\#ftn/html/g" > $(DOCUMENT)2.html
	mv $(DOCUMENT)2.html $(DOCUMENT).html
	#
	ebook-convert $(DOCUMENT).html $(DOCUMENT).epub --max-levels 0 --pretty-print --level1-toc //h:h1 --level2-toc //h:h2 --level3-toc //h:h3 --max-toc-links 0 --toc-threshold 3  --chapter-mark pagebreak  --cover $(DOCUMENT_COVER) --extra-css $(TEXTALLIONFOLDER)/includes/epub.css --no-default-epub-cover  --preserve-cover-aspect-ratio --no-chapters-in-toc --disable-font-rescaling
	# --filter-css font-family
	#
	ebook-meta  $(DOCUMENT).epub --title "$(DOCUMENT_TITLE)" --authors "$(DOCUMENT_AUTHOR)" --tags "$(DOCUMENT_TAGS)" --language $(DOCUMENT_LANGUAGE) --book-producer 'textallion - https://textallion.sourceforge.io' --comments "$(DOCUMENT_INFO)" --cover $(DOCUMENT_COVER) 

# split (not working well...)


gempub:
#https://git.sr.ht/~boringcactus/md2gemtext
	-mkdir /tmp/$(DOCUMENT)
	$(TXT2TAGS) -t gmi --outfile /tmp/$(DOCUMENT)/index.gmi $(DOCUMENT).t2t
	zip -r $(DOCUMENT).gpub /tmp/$(DOCUMENT)

split:
	htmldoc --no-links --charset utf8 --strict --book -t htmlsep -d ebook $(DOCUMENT)2.html
	#$(TXT2TAGS) -t html --split 2 --no-toc --outfile $(DOCUMENT).html $(DOCUMENT).t2t 

website:
	cat $(TEXTALLIONFOLDER)/templates/website.html | sed -e "s|%%DOCUMENT AUTHOR%%|$(DOCUMENT_AUTHOR)|g" | sed -e "s|%%DOCUMENT TITLE%%|$(DOCUMENT_TITLE)|g" | sed -e "s|%%DOCUMENT%%|$(DOCUMENT)|g"  | sed -e "s|%%DOCUMENT COVER%%|$(DOCUMENT_COVER)|g" > index_$(DOCUMENT).html


cover:
	convert $(DOCUMENT).svg $(DOCUMENT).jpg
	convert $(DOCUMENT).svg $(DOCUMENT).png
	#convert $(DOCUMENT).svg $(DOCUMENT)_cover.pdf
	
	
configuration-update:
	$(DIFFTOOL) makefile $(TEXTALLIONFOLDER)/samples/makefile
	$(DIFFTOOL) $(DOCUMENT).sty $(TEXTALLIONFOLDER)/includes/sample.sty
	$(DIFFTOOL) $(DOCUMENT).css $(TEXTALLIONFOLDER)/includes/sample.css


# images (thumbnails)

vignettes:
	sh $(TEXTALLIONFOLDER)/core/vignettes.sh
	mv vignettes_doc.t2t vignettes_$(DOCUMENT).t2t
	sed -i -e "s/@@DOCUMENT_TITLE@@/$(DOCUMENT_TITLE)/"  vignettes_$(DOCUMENT).t2t
	sed -i -e "s/@@DOCUMENT_AUTHOR@@/$(DOCUMENT_AUTHOR)/"  vignettes_$(DOCUMENT).t2t
	$(TXT2TAGS) -T $(TEXTALLIONFOLDER)/templates/xhtml.html -t xhtml --style=$(TEXTALLIONFOLDER)/includes/sample.css --css-inside --no-toc --outfile vignettes_$(DOCUMENT).html vignettes_$(DOCUMENT).t2t


	#$(TXT2TAGS) -T $(TEXTALLIONFOLDER)/templates/xhtml.html -t xhtml --css-inside --toc --outfile #$(DOCUMENT).html $(DOCUMENT).t2t


zim:
	# https://github.com/openzim/zim-tools
	# get binary:  http://download.openzim.org/release/zim-tools/
	# get readers: https://wiki.openzim.org/wiki/Readers
	rm -i /tmp/$(DOCUMENT).zim
	zimwriterfs -w $(DOCUMENT).html -I $(TEXTALLIONFOLDER)/media/logo_textallion.png -l fre -t "$(DOCUMENT_TITLE)" -d "$(DOCUMENT_TITLE)"  -c "$(DOCUMENT_AUTHOR)" -p "$(DOCUMENT_AUTHOR)" ./ /tmp/$(DOCUMENT).zim
	echo "Document has been created into /tmp/$(DOCUMENT).zim"
	
	
# CLEAN part 


clean: clean-temp

clean-temp:
	-rm  *~ 
	-rm  .*~
	-rm  $(DOCUMENT).toc
	-rm  $(DOCUMENT).tex
	-rm  $(DOCUMENT)_slide.tex
	-rm  $(DOCUMENT)2.html
	-rm  $(DOCUMENT).ps
	-rm  $(DOCUMENT)_booklet.ps
	-rm  *.log 
	-rm  *.out
	-rm  *.aux
	-rm  *.toc
	-rm  *.nav
	-rm  *.snm
	-rm  *.ilg
	-rm  *.idx
	-rm  *.ind
	-rm  *.fax
	-rm  *.tns
	-rm check.txt



clean-docs:
	-rm -i $(DOCUMENT).pdf
	-rm -i $(DOCUMENT)*.pdf
	-rm -i $(DOCUMENT)*.html
	-rm -i $(DOCUMENT).epub
	-rm -i vignettes_*
	-rm -fri tb
	-rm -i *graph.svg
	-rm -i *graph.png
	-rm -i *graph.txt
	-rm -i *.pdf
	-rm -i *.ps
	-rm -i *.tex
	-rm -i *.html
	-rm -i *.epub

	


cleanall: clean-temp clean-docs

clean-everything: cleanall


DOCUMENTNEWNAME = newname

rename:
	@echo "Edit the DOCUMENTNEWNAME variable at the end of the makefile (no space please)"
	@echo "(current document name to replace is $(DOCUMENT))"
	@echo "(current document new name is $(DOCUMENTNEWNAME))"
	@echo "(We will keep the older $(DOCUMENT).t2t as a reference)"
	@echo "press a key to start"
	@read PAUSE
	-cp -i $(DOCUMENT).t2t $(DOCUMENTNEWNAME).t2t
	-mv $(DOCUMENT).sty $(DOCUMENTNEWNAME).sty
	-mv $(DOCUMENT).css $(DOCUMENTNEWNAME).css
	-mv $(DOCUMENT).jpg $(DOCUMENTNEWNAME).jpg
	-mv $(DOCUMENT).png $(DOCUMENTNEWNAME).png
	-mv $(DOCUMENT).svg $(DOCUMENTNEWNAME).svg
	-sed -i -e "s/$(DOCUMENT)/$(DOCUMENTNEWNAME)/" $(DOCUMENTNEWNAME).t2t
	-sed -i -e "s/$(DOCUMENT)/$(DOCUMENTNEWNAME)/" makefile




#!/usr/bin/env bash
# create a simple photo album with txt2tags
	
if [ ! -d tb ]; then 
	mkdir tb
fi
	# create thumbnails and then populate the t2t file
	echo -e "@@DOCUMENT_TITLE@@\n@@DOCUMENT_AUTHOR@@\n\n" > vignettes_doc.t2t
	jpgfiles=$(ls *.jpg 2> /dev/null | wc -l)
	if [ "$jpgfiles" != "0" ]; then
		for A in *.jpg ; do convert $A -geometry '120x120>' -bordercolor white -border 50 -gravity center -crop 100x100+0+0 tb/tb_$A ; done
		for A in *.jpg ; do echo [[tb/tb_$A] $A] >> vignettes_doc.t2t ; done
	fi
	pngfiles=$(ls *.png 2> /dev/null | wc -l)
	if [ "$pngfiles" != "0" ]; then
		for B in *.png ; do convert $B -geometry '120x120>' -bordercolor white -border 50 -gravity center -crop 100x100+0+0 tb/tb_$B ; done
		for B in *.png ; do echo [[tb/tb_$B] $B] >> vignettes_doc.t2t ; done
	fi
	giffiles=$(ls *.gif 2> /dev/null | wc -l)
	if [ "$giffiles" != "0" ]; then
		for A in *.gif ; do convert $A -geometry '120x120>' -bordercolor white -border 50 -gravity center -crop 100x100+0+0 tb/tb_$A ; done
		for A in *.gif ; do echo [[tb/tb_$A] $A] >> vignettes_doc.t2t ; done
	fi
	videofiles=$(ls *.m4v 2> /dev/null | wc -l)
	if [ "$jvideofiles" != "0" ]; then
		for C in *m4v ; do ffmpeg -i $C -an -ss 00:00:08 -an -r 1 -vframes 1 -y -s qqvga -f mjpeg tb/tb_$C.jpg ; convert tb/tb_$C.jpg -pointsize 12 -fill white  -undercolor '#00000080'  -gravity South  -annotate +0+5 ' VIDEO ' tb/tb_$C.jpg ; done
		for C in *m4v ; do echo [[tb/tb_$C.jpg] $C] >> vignettes_doc.t2t ; done
	fi
		pdffiles=$(ls *.pdf 2> /dev/null | wc -l)
	if [ "$pdffiles" != "0" ]; then
		for A in *.pdf ; do echo "- [$A $A]" >> vignettes_doc.t2t ; done
	fi
	

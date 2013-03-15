#!/usr/bin/env bash

# %%%% TeXTallion %%%%
# Tiny almost-Kiss Word Processor
# http://anamnese.online.fr/site2/textallion/docs/presentation.html
# Complete source code: http://textallion.googlecode.com
# License: http://creativecommons.org/licenses/by-sa/3.0/

# initiate the variables, from the user's input


# make a pause. Resume by keypress.
pause(){
	echo ""
	echo "(PRESS A KEY TO CONTINUE)"
	echo ""
	read -s -n 1 -p "$*"
}

banner(){
	if [[ `uname` =~ "CYGWIN" ]] ; then echo "" ; else clear
	fi
	echo -e "\n
 @---------------@                    
 / Le TeXtallion /                   
 @---------------@\n\n"
}

introduction(){
	if [[ `uname` =~ "CYGWIN" ]] ; then echo "" ; else clear
	fi
	echo -e "\n
 @----------------------------------------@                    
 / Le TeXtallion, a simple word processor /                   
 @----------------------------------------@\n\n"
	echo "1: Create a new document"
	echo "2: Manipulate sources or Generate HTML, PDF, EPUB..."
	echo ""
	echo "3: More options and other tools (manipulate CYOA, letters, updates...)"
	echo "4: Help"
	echo "0: Quit"
	echo ""
read ACTION

case $ACTION in
				create | new | "1")
					choose_type_document
					;;
				generate| manipulate | "2")
					choose_doc
					;;
				other|more|"3")
					manipulate_ter
					;;
				help|"4")
					help
					;;
				quit|"0")
					quit
					;;
				*)
					introduction
					;;
esac
}

help(){
	echo -e "This command-line interface is a replacement for the manipulation of a makefile. Please visit http://textallion.googlecode.com for more information about textallion."
	pause
	introduction
}

test_OS(){
if [[ `uname` =~ "CYGWIN" ]]; then 
    OS=Win
    #export?
	TEXTALLIONPATH=C:/cygwin/usr/share/textallion/
	TEXTALLIONDOCSPATH=~/textalliondocs
	SUDO=
else
    OS=Unix
    #export?
	TEXTALLIONPATH=/usr/share/textallion/
	TEXTALLIONDOCSPATH=~/textalliondocs
	SUDO=sudo
fi
}

updatetextallion(){
if [ ! -d $TEXTALLIONPATH ]; then 
	echo "$TEXTALLIONPATH is not present on this system. We'll try to run the installer instead."
	pause
	installtextallion
else
	cd $TEXTALLIONPATH
	$SUDO hg pull
	$SUDO hg update  -C 
fi
}

installtextallion(){
if [ -e $TEXTALLIONPATH ]; then 
	echo "$TEXTALLIONPATH is already present on this system. We'll try to run the updater instead."
	pause
	updatetextallion
else
	echo "Textallion will be installed into $TEXTALLIONPATH: this folder will be created, then it will be synchronized with the development version, using Mercurial. Is it ok? (Y/n)"
		read choice
			case $choice in
					"n"|"N"|"no"|"NO"|"non")
						echo "Nothing was changed in your configuration"
						;;
					"y"|"Y"|"yes"|*)
					$SUDO mkdir -p $TEXTALLIONPATH/.hg
					echo "[paths]" | $SUDO tee -a $TEXTALLIONPATH/.hg/hgrc
					echo "default = https://textallion.googlecode.com/hg/" | sudo tee -a $TEXTALLIONPATH/.hg/hgrc	
					updatetextallion	
						;;
			esac
fi
}
	

quit(){
echo -e "\nGoodbye :)\n\n       http://textallion.googlecode.com  \n  "
exit
}

choose_doc(){
banner
if [ -e ${TEXTALLIONDOCSPATH} ]; then 
	echo -e "Here are your already existing documents:\n  "
	#ls ${TEXTALLIONDOCSPATH}/
	# scan only for folders, and remove cyoa games and the trailing slash
	ls -p ${TEXTALLIONDOCSPATH}/ | grep "/" | sed 's@/@ @' | sed 's@cyoa-[a-z_-]*@@' | tr -d "\n"
	
	echo -e "\n\nWhich one do you select? (please type the full name)"
	echo ""
	read DOCUMENTNAME
	#export DOCUMENTNAME
		if [ -f ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME/$DOCUMENTNAME.t2t ]; then
			manipulate_doc
		else
			echo "This document is not existing, please choose another one or create a new one."
			pause
			introduction
		fi
else
	echo -e "It's probably the first time you're using textallion. We'll make you create a new document now. "
	pause
	create_new_doc
fi
}

manipulate_doc(){
	banner
	echo "1: Edit document $DOCUMENTNAME"
	echo ""
	echo "2: Generate HTML from $DOCUMENTNAME"
	echo "3: Generate PDF from $DOCUMENTNAME"
	echo "4: Generate EPUB from $DOCUMENTNAME"
	echo ""
	echo "5: read HTML from $DOCUMENTNAME"
	echo "6: read PDF from $DOCUMENTNAME"
	echo "7: read EPUB from $DOCUMENTNAME"
	echo ""
	echo "8: More options (index etc.)"
	echo ""
	echo "9: Choose another document to manipulate"
	echo ""
	echo "0: Previous menu"
	echo ""
	read ACTION
case $ACTION in
				edit | "1")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME/
					make edit
					manipulate_doc
					;;
				html|"2")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make html
					pause
					manipulate_doc
					;;
				pdf|"3")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make pdf
					pause
					manipulate_doc
					;;
				epub|"4")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make epub
					pause
					manipulate_doc
					;;
				readhtml|"5")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make readhtml
					pause
					manipulate_doc
					;;
				read|"6")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
						if [[ `uname` =~ "CYGWIN" ]] ; then echo "If SumatraPDF is not installed, please enter ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME and open the PDF from there." ; sumatrapdf $DOCUMENTNAME.pdf ; else make read
						fi
					pause
					manipulate_doc
					;;
				readepub|"7")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make readepub
					pause
					manipulate_doc
					;;
				more|"8")
					manipulate_bis
					;;
				another|"9")
					choose_doc
					;;
				previous|"0")
					introduction
					;;
				*)
					manipulate_doc
					;;	
esac
}


manipulate_bis(){
	banner
	echo ""
	echo "1: Generate HTML, PDF and EPUB, then create an html index to distribute your files on internet"
	echo "2: read HTML index of the distributed version of $DOCUMENTNAME"
	echo ""
	echo "3: Synchronize $DOCUMENTNAME makefile, LaTeX style and CSS style (need a diff tool, for Linux version)"
	echo ""	
	echo "5: Generate a cover from the svg document (need image-magick)"
	echo ""
	echo "9: Command-line interface to the document folder $DOCUMENTNAME (for using makefile for ex.)"
	echo ""
	echo "0: Previous menu"
	echo ""
	read ACTION
case $ACTION in
				all|"1")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make all
					pause
					manipulate_bis
					;;
				readindex|"2")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make readindex
					pause
					manipulate_bis
					;;				
				synchronize|"3")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make configuration-update
					pause
					manipulate_bis
					;;		
				cmd|"9")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME/
					echo -e "(Type ctrl-d to exit once you have finished.)\n"
					bash -
					;;
				cover|"5")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME/
					make cover
					pause
					manipulate_bis
					;;
				previous|"0")
					manipulate_doc
					;;		

				*)
					manipulate_bis
					;;	
esac
}

manipulate_ter(){
	banner
	echo ""
	echo "1: Create a new CYOA document"
	echo "2: Manipulate a CYOA document"
	echo ""
	echo "3: Create a new LETTER document (French lettre)"
	echo "4: Manipulate a LETTER document"
	echo ""
	echo "7: Try to install textallion on the system, if it's not already there"
	echo "8: Try to update textallion with the current devel version (need to be root on Linux)"
	echo ""
	echo "0: Previous menu"
	echo ""
	read ACTION
case $ACTION in
				cyoa|"1")
					create_new_cyoa
					pause
					manipulate_ter
					;;
				manipulate|"2")
					choose_cyoa
					pause
					manipulate_ter
					;;
				lettre|"3")
					create_new_lettre
					pause
					manipulate_ter
					;;
				lettreedit|"4")
					choose_lettre
					pause
					manipulate_ter
					;;
				install|"7")
					installtextallion
					pause
					manipulate_ter
					;;
				update|"8")
					updatetextallion
					pause
					manipulate_ter
					;;
				previous|"0")
					introduction
					;;		
				*)
					manipulate_ter
					;;	
esac
}

create_new_doc(){
banner
echo -e "This script will initiate a new document. All requested data are mandatory, except for the tags and the language code.\n"

echo "What is the name of the document file (and folder) to be created? (Try to avoid accented letters, spaces and funky characters)"
read DOCUMENTNAME

echo "What is the title name of the document file to be created? "
read DOCUMENTTITLE

echo "Who is the author?"
read AUTHORNAME

echo "What are the tags defining this document (separated by commas)?"
read DOCTAGS

echo "What is the language code of the document (2 letters, i.e. 'en' for English)?"
read DOCLANG

# replace space by underscore for the output files, remove accented letters, lower case

DOCUMENTFOLDER=`echo ${DOCUMENTNAME} | sed 's/ /_/g' | sed 's/\x27/_/g' | sed 's/[êèéëÊÈÉË]/e/g' | sed 's/[îìíïÎÏ]/i/g' | sed 's/[áåàäâÀÂÄ]/a/g' | sed 's/[øôóòöÔÖ]/o/g' | sed 's/[üûùúÙÛÜ]/u/g' | sed y/ABCDEFGHIJKLMNOPQRSTUVWXYZçÿ/abcdefghijklmnopqrstuvwxyzcy/ `

# now test existing folder and finish the generation
export CYOASTATUS=
export CYOAINIT=
test_folder

# continue to the manipulation options
export DOCUMENTNAME=$DOCUMENTFOLDER
manipulate_doc
}



## CYOA



create_new_cyoa(){
banner
echo -e "This script will initiate a new CYOA game. All requested data are mandatory, except for the tags and the language code.\n"

echo "What is the name of the game file (and folder) to be created? (Try to avoid accented letters, spaces and funky characters). We'll add cyoa- to the title."
read DOCUMENTNAME

echo "What is the title name of the document file to be created? "
read DOCUMENTTITLE

echo "Who is the author?"
read AUTHORNAME

echo "What are the tags defining this document (separated by commas)?"
read DOCTAGS

echo "What is the language code of the document (2 letters, i.e. 'en' for English)?"
read DOCLANG

# replace space by underscore for the output files, remove accented letters, lower case

DOCUMENTFOLDER=cyoa-`echo ${DOCUMENTNAME} | sed 's/ /_/g' | sed 's/\x27/_/g' | sed 's/[êèéëÊÈÉË]/e/g' | sed 's/[îìíïÎÏ]/i/g' | sed 's/[áåàäâÀÂÄ]/a/g' | sed 's/[øôóòöÔÖ]/o/g' | sed 's/[üûùúÙÛÜ]/u/g' | sed y/ABCDEFGHIJKLMNOPQRSTUVWXYZçÿ/abcdefghijklmnopqrstuvwxyzcy/ `

# now test existing folder and finish the generation
# (now includeconf txt2tags.t2t will be included into the makefile)
#export CYOASTATUS="%!includeconf: /usr/share/textallion/core/txt2cyoa.t2t\n"
export CYOASTATUS=""
export CYOAINIT="== 0 ==\n\n- Start the game: 1\n\n\n== 1 ==\n\n\n"
test_cyoa_folder

# continue to the manipulation options
export DOCUMENTNAME=$DOCUMENTFOLDER
manipulate_cyoa
}

choose_cyoa(){
banner
if [ -e ${TEXTALLIONDOCSPATH} ]; then 
	echo -e "Here are your already existing games:\n  "
	#ls ${TEXTALLIONDOCSPATH}/
	# scan only for folders beginning by cyoa-, and remove the trailing slash
	ls -p ${TEXTALLIONDOCSPATH}/ | grep "cyoa-" | sed 's@/@ @' | tr -d "\n"
	
	echo -e "\n\nWhich one do you select? (please type the full name, but you can omit the \"cyoa-\" part)"
	echo ""
	read DOCUMENTNAME
	#export DOCUMENTNAME
		if [ -f ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME/$DOCUMENTNAME.t2t ]; then
			manipulate_cyoa
	    elif [ -f ${TEXTALLIONDOCSPATH}/cyoa-$DOCUMENTNAME/cyoa-$DOCUMENTNAME.t2t ]; then
			export DOCUMENTNAME=cyoa-$DOCUMENTNAME
			manipulate_cyoa	
		else
			echo "This game is not existing, please choose another one or create a new one."
			pause
			manipulate_ter
		fi
else
	echo -e "It's probably the first time you're using textallion. We'll make you create a new game now. "
	pause
	create_new_cyoa
fi
}

manipulate_cyoa(){
	banner
	echo "1: Edit game $DOCUMENTNAME"
	echo ""
	echo "2: Generate HTML from $DOCUMENTNAME"
	echo "3: Generate PDF from $DOCUMENTNAME"
	echo "4: Generate EPUB from $DOCUMENTNAME"
	echo ""
	echo "5: read HTML from $DOCUMENTNAME"
	echo "6: read PDF from $DOCUMENTNAME"
	echo "7: read EPUB from $DOCUMENTNAME"
	echo ""
	echo "8: More options (export to renpy, undum, choicescript, create graph etc)"
	echo ""
	echo "9: Choose another document to manipulate"
	echo ""
	echo "0: Previous menu"
	echo ""
	read ACTION
case $ACTION in
				edit | "1")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME/
					make edit
					manipulate_cyoa
					;;
				html|"2")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make cyoa-html
					pause
					manipulate_cyoa
					;;
				pdf|"3")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make cyoa-pdf
					pause
					manipulate_cyoa
					;;
				epub|"4")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make cyoa-epub
					pause
					manipulate_cyoa
					;;
				readhtml|"5")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make readhtml
					pause
					manipulate_cyoa
					;;
				read|"6")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
						if [[ `uname` =~ "CYGWIN" ]] ; then echo "If SumatraPDF is not installed, please enter ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME and open the PDF from there." ; sumatrapdf $DOCUMENTNAME.pdf ; else make read
						fi
					pause
					manipulate_cyoa
					;;
				readepub|"7")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make readepub
					pause
					manipulate_cyoa
					;;
				more|"8")
					manipulate_cyoa2
					;;
				another|"9")
					choose_cyoa
					;;
				previous|"0")
					manipulate_ter
					;;
				*)
					manipulate_cyoa
					;;	
esac
}


manipulate_cyoa2(){
	banner
	echo "1: Generate a graph of the nodes"
	echo ""
	echo "2: Export to Ramus format"
	echo "3: Export to Renpy format"
	echo "4: Export to Hyena format"
	echo "5: Export to Twee/Twine format"
	echo "6: Export to Undum format"
	echo "7: Export to Choice-script format"
	echo "8: Export to Inform 7 format"
	echo ""
	echo "9: Command-line interface to the game folder $DOCUMENTNAME (for using makefile for ex.). "
	echo ""
	echo "0: Previous menu"
	echo ""
	read ACTION
case $ACTION in
				graph | "1")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make cyoa-graph
					pause
					manipulate_cyoa2
					;;
				ramus|"2")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make cyoa-ramus
					pause
					manipulate_cyoa2
					;;
				renpy|"3")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make cyoa-renpy
					pause
					manipulate_cyoa2
					;;
				hyena|"4")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make cyoa-hyena
					pause
					manipulate_cyoa2
					;;
				twee|twine|"5")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make cyoa-twee
					pause
					manipulate_cyoa2
					;;
				undum|"6")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make cyoa-undum
					pause
					manipulate_cyoa2
					;;
				inform7|"8")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make cyoa-inform7
					pause
					manipulate_cyoa2
					;;
				cs|choicescript|"7")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make cyoa-cs
					pause
					manipulate_cyoa2
					;;
				cmd|"9")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME/
					echo -e "(Type ctrl-d to exit once you have finished.)\n"
					bash -
					;;
				previous|"0")
					manipulate_cyoa
					;;
				*)
					manipulate_cyoa2
					;;	
esac
}


	
### Lettre

create_new_lettre(){
banner
echo -e "This script will initiate a new lettre. All requested data are mandatory, except for the tags and the language code.\n"

echo "What is the name of the lettre file (and folder) to be created? (Try to avoid accented letters, spaces and funky characters). We'll add lettre- to the title."
read DOCUMENTNAME

echo "What is the title name of the document file to be created? "
read DOCUMENTTITLE

echo "Who is the author?"
read AUTHORNAME

echo "What are the tags defining this document (separated by commas)?"
read DOCTAGS

echo "What is the language code of the document (2 letters, i.e. 'en' for English)?"
read DOCLANG

# replace space by underscore for the output files, remove accented letters, lower case

DOCUMENTFOLDER=lettre-`echo ${DOCUMENTNAME} | sed 's/ /_/g' | sed 's/\x27/_/g' | sed 's/[êèéëÊÈÉË]/e/g' | sed 's/[îìíïÎÏ]/i/g' | sed 's/[áåàäâÀÂÄ]/a/g' | sed 's/[øôóòöÔÖ]/o/g' | sed 's/[üûùúÙÛÜ]/u/g' | sed s/ABCDEFGHIJKLMNOPQRSTUVWXYZçÿ/abcdefghijklmnopqrstuvwxyzcy/g `

# now test existing folder and finish the generation
# (now includeconf txt2tags.t2t will be included into the makefile)
#export lettreSTATUS="%!includeconf: ${TEXTALLIONPATH}/core/txt2lettre.t2t\n"
export lettreSTATUS=""
export lettreINIT="% TODO"
test_lettre_folder

# continue to the manipulation options
export DOCUMENTNAME=$DOCUMENTFOLDER
manipulate_lettre
}

choose_lettre(){
banner
if [ -e ${TEXTALLIONDOCSPATH} ]; then 
	echo -e "Here are your already existing lettres:\n  "
	#ls ${TEXTALLIONDOCSPATH}/
	# scan only for folders beginning by lettre-, and remove the trailing slash
	ls -p ${TEXTALLIONDOCSPATH}/ | grep "lettre-" | sed 's@/@ @' | tr -d "\n"
	
	echo -e "\n\nWhich one do you select? (please type the full name, but you can omit the \"lettre-\" part)"
	echo ""
	read DOCUMENTNAME
	#export DOCUMENTNAME
		if [ -f ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME/$DOCUMENTNAME.t2t ]; then
			manipulate_lettre
	    elif [ -f ${TEXTALLIONDOCSPATH}/lettre-$DOCUMENTNAME/lettre-$DOCUMENTNAME.t2t ]; then
			export DOCUMENTNAME=lettre-$DOCUMENTNAME
			manipulate_lettre	
		else
			echo "This lettre is not existing, please choose another one or create a new one."
			pause
			manipulate_ter
		fi
else
	echo -e "It's probably the first time you're using textallion. We'll make you create a new document now. "
	pause
	create_new_lettre
fi
}

manipulate_lettre(){
	banner
	echo "1: Edit lettre $DOCUMENTNAME"
	echo ""
	#echo "2: Generate HTML from $DOCUMENTNAME"
	echo "3: Generate PDF from $DOCUMENTNAME"
	#echo "4: Generate EPUB from $DOCUMENTNAME"
	echo ""
	#echo "5: read HTML from $DOCUMENTNAME"
	echo "6: read PDF from $DOCUMENTNAME"
	echo ""
	echo "7: Clean folder (remove temporary files)"
	echo ""
	echo "8: More options (none at the moment)"
	echo ""
	echo "9: Choose another document to manipulate"
	echo ""
	echo "0: Previous menu"
	echo ""
	read ACTION
case $ACTION in
				edit | "1")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME/
					make edit
					manipulate_lettre
					;;
				html|"2")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make lettre-html
					pause
					manipulate_lettre
					;;
				pdf|"3")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make lettre
					pause
					manipulate_lettre
					;;
				epub|"4")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make lettre-epub
					pause
					manipulate_lettre
					;;
				readhtml|"5")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make readhtml
					pause
					manipulate_lettre
					;;
				read|"6")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
						if [[ `uname` =~ "CYGWIN" ]] ; then echo "If SumatraPDF is not installed, please enter ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME and open the PDF from there." ; sumatrapdf $DOCUMENTNAME.pdf ; else make read
						fi
					pause
					manipulate_lettre
					;;
				clean|"7")
					cd ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME
					make clean
					manipulate_lettre
					;;
				more|"8")
					manipulate_lettre2
					;;
				another|"9")
					choose_lettre
					;;
				previous|"0")
					manipulate_ter
					;;
				*)
					manipulate_lettre
					;;	
esac
}


## SETUP

setup(){
mkdir -p ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}

cp $TEXTALLIONPATH/samples/makefile ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}
cp $TEXTALLIONPATH/includes/sample.css ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.css
cp $TEXTALLIONPATH/includes/sample.sty ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.sty

cp $TEXTALLIONPATH/media/textallion_cover.svg ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.svg

cp $TEXTALLIONPATH/media/sample_cover.png ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.png

cp $TEXTALLIONPATH/media/sample_cover.jpg ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.jpg


sed -i -e "s@TEXTALLIONFOLDER = ../@TEXTALLIONFOLDER = ${TEXTALLIONPATH}/@g" ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/makefile
sed -i -e "s@DOCUMENT = examples@DOCUMENT = ${DOCUMENTFOLDER}@g" ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/makefile
sed -i -e "s@xx DOCUMENT LANGUAGE xx@${DOCLANG}@g" ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/makefile
sed -i -e "s@xx DOCUMENT AUTHOR xx@${AUTHORNAME}@g" ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/makefile
sed -i -e "s@xx DOCUMENT TITLE xx@${DOCUMENTTITLE}@g" ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/makefile
sed -i -e "s@xx DOCUMENT TAGS xx@${DOCTAGS}@g" ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/makefile

sed -i -e "s@xx DOCUMENT DATE xx@`date +%Y-%m-%d`@g" ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/makefile

# replace info in cover
sed -i -e "s@Author@${AUTHORNAME}@g"  ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.svg
sed -i -e "s@Le Textallion@${DOCUMENTTITLE}@g"  ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.svg


echo ${DOCUMENTTITLE} > ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo ${AUTHORNAME}   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e "`date +%Y-%m-%d`\n\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e "%% DEF DOCUMENT METADATA. Use your own. Remplace the second part only, don't modify the xx DOCUMENT ## xx \n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e "%!postproc(tex): 'xx DOCUMENT TITLE xx' '${DOCUMENTTITLE}'\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e "%!postproc(tex): 'xx DOCUMENT AUTHOR xx' '${AUTHORNAME}'\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e "%!postproc(tex): 'xx DOCUMENT TAGS xx' '${DOCTAGS}'\n\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t

echo -e "%!style(tex): ${DOCUMENTFOLDER}.sty\n" >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e "%!style(xhtml): ${DOCUMENTFOLDER}.css\n\n" >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e "%!includeconf: ${TEXTALLIONPATH}/core/textallion.t2t\n" >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e ${CYOASTATUS} >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e "%!postproc(tex): 'TEXTALLIONPATH' '${TEXTALLIONPATH}'\n\n" >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e ${CYOAINIT} >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t

echo "${DOCUMENTFOLDER} was created into the textalliondocs folder in your home. You can modify it from here and generate the target documents with this menu driven command line. (You can also enter this folder, edit ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t with the text editor of your choice, and in order to generate the final documents, type \"make pdf\" or \"make html\" or \"make epub\"...)"
pause
}


## SETUPLETTRE

setup_lettre(){
mkdir -p ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}

cp ${TEXTALLIONPATH}/samples/makefile ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}
# cp ${TEXTALLIONPATH}/includes/sample.css ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.css
# cp ${TEXTALLIONPATH}/includes/sample.sty ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.sty

# cp ${TEXTALLIONPATH}/media/textallion_cover.svg ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.svg

# cp ${TEXTALLIONPATH}/media/sample_cover.png ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.png


sed -i -e "s@TEXTALLIONFOLDER = ../@TEXTALLIONFOLDER = ${TEXTALLIONPATH}/@g" ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/makefile
sed -i -e "s@DOCUMENT = examples@DOCUMENT = ${DOCUMENTFOLDER}@g" ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/makefile
sed -i -e "s@xx DOCUMENT LANGUAGE xx@${DOCLANG}@g" ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/makefile
sed -i -e "s@xx DOCUMENT AUTHOR xx@${AUTHORNAME}@g" ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/makefile
sed -i -e "s@xx DOCUMENT TITLE xx@${DOCUMENTTITLE}@g" ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/makefile
sed -i -e "s@xx DOCUMENT TAGS xx@${DOCTAGS}@g" ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/makefile

sed -i -e "s@xx DOCUMENT DATE xx@`date +%Y-%m-%d`@g" ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/makefile

# replace info in cover
#sed -i -e "s@Author@${AUTHORNAME}@g"  ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.svg
#sed -i -e "s@Le Textallion@${DOCUMENTTITLE}@g"  ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.svg


echo ${DOCUMENTTITLE} > ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo ${AUTHORNAME}   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e "`date +%Y-%m-%d`\n\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t

#%!postproc(tex): 'xx DOCUMENT TAGS xx' 'lettre'

#%!postproc(tex): 'xx DOCUMENT AUTHOR CURRENT LOCATION xx'   'Rameville'
#%!postproc(tex): 'xx DOCUMENT AUTHOR GENDER xx'             'M.'
#%!postproc(tex): 'xx DOCUMENT AUTHOR xx'                    'Guillaume \\textsc{Grumbold}'
#%!postproc(tex): 'xx DOCUMENT AUTHOR STREET xx'             '42, rue du Cerf'
#%!postproc(tex): 'xx DOCUMENT AUTHOR POSTAL CODE xx'        '77444'
#%!postproc(tex): 'xx DOCUMENT AUTHOR TOWN xx'               'Trifouilly en Brie'
#%!postproc(tex): 'xx DOCUMENT AUTHOR PHONE xx'              '42 58 24 87 28'
#%!postproc(tex): 'xx DOCUMENT AUTHOR FAX xx'                '42 58 24 87 29'
#%!postproc(tex): 'xx DOCUMENT AUTHOR EMAIL xx'              'g.grumbold@biblio-rameville.net'


#%!postproc(tex): 'xx DOCUMENT RECIPIENT GENDER xx'          'Madame'
#%!postproc(tex): 'xx DOCUMENT RECIPIENT xx'                 '\\\textsc{Mélanie Farjot}'
#%!postproc(tex): 'xx DOCUMENT RECIPIENT STREET xx'          '1, rue Maréchal Livolas'
#%!postproc(tex): 'xx DOCUMENT RECIPIENT POSTAL CODE xx'     '77223'
#%!postproc(tex): 'xx DOCUMENT RECIPIENT TOWN xx'            'Villedaim'
#%!postproc(tex): 'xx DOCUMENT RECIPIENT PHONE xx'           'Tél : 41 83 53 54 22'
#%!postproc(tex): 'xx DOCUMENT RECIPIENT FAX xx'             'Fax : 41 83 53 54 43'

#%!postproc(tex): 'xx DOCUMENT TITLE xx'                     'Retour des livres' 
#%!postproc(tex): '%\\\date{}'                                '\\\date{le 9 mars 2012}'


echo -e "%% DEF DOCUMENT METADATA. Use your own. Remplace the second part only, don't modify the xx DOCUMENT ## xx \n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t

echo -e "%!postproc(tex): 'xx DOCUMENT TAGS xx' '${DOCTAGS}'\n\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t

if [ -f ${TEXTALLIONDOCSPATH}/signature.txt ]; then 
	echo "We use your default signature"
	cat ${TEXTALLIONDOCSPATH}/signature.txt >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
else
	echo -e "\n\nYou don't have a default signature, so we create one in " ${TEXTALLIONDOCSPATH}
	echo -e "\n\n"
	cp ${TEXTALLIONPATH}/templates/signature.txt ${TEXTALLIONDOCSPATH}/signature.txt
	cat ${TEXTALLIONDOCSPATH}/signature.txt >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
fi

echo -e "\n" >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t

echo -e "%!postproc(tex): 'xx DOCUMENT RECIPIENT GENDER xx'          'Madame'\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -E "%!postproc(tex): 'xx DOCUMENT RECIPIENT xx'                 '\\\textsc{Mélanie Farjot}'"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e "%!postproc(tex): 'xx DOCUMENT RECIPIENT STREET xx'          '1, rue Maréchal Livolas'"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e "%!postproc(tex): 'xx DOCUMENT RECIPIENT POSTAL CODE xx'     '77223'"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e "%!postproc(tex): 'xx DOCUMENT RECIPIENT TOWN xx'            'Villedaim'\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e "%!postproc(tex): 'xx DOCUMENT RECIPIENT PHONE xx'           'Tél : 41 83 53 54 22'"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e "%!postproc(tex): 'xx DOCUMENT RECIPIENT FAX xx'             'Fax : 41 83 53 54 43'\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t

echo -e "%!postproc(tex): 'xx DOCUMENT TITLE xx' '${DOCUMENTTITLE}'\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t

echo -e "%!postproc(tex): '%\\\\date{}' '\\\\date{le 9 mars 2012}'\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t



echo -e "%!style(tex): ${TEXTALLIONPATH}/includes/sample.sty\n" >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
# echo -e "%!style(xhtml): ${DOCUMENTFOLDER}.css\n\n" >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e "%!includeconf: ${TEXTALLIONPATH}/core/textallion.t2t\n" >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e ${CYOASTATUS} >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e "%!postproc(tex): 'TEXTALLIONPATH' '${TEXTALLIONPATH}'\n\n" >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo -e ${CYOAINIT} >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t

echo "${DOCUMENTFOLDER} was created into the textalliondocs folder in your home. You can modify it from here and generate the target documents with this menu driven command line. (You can also enter this folder, edit ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t with the text editor of your choice, and in order to generate the final documents, type \"make pdf\" or \"make html\" or \"make epub\"...)"
pause
}


## TESTS

test_folder(){
if [ -e ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER} ]; then 
	echo "This folder ~/${DOCUMENTFOLDER} is already present. Please choose another name or remove this folder, and run \"textallion\" again."
	pause
	create_new_doc
else
	setup
fi
}


test_cyoa_folder(){
if [ -e ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER} ]; then 
	echo "This folder ~/${DOCUMENTFOLDER} is already present. Please choose another name or remove this folder, and run \"textallion\" again."
	pause
	create_new_cyoa
else
	setup
	cp -fr ${TEXTALLIONPATH}/includes/sample_cyoa.sty ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.sty
fi
}

test_lettre_folder(){
if [ -e ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER} ]; then 
	echo "This folder ~/${DOCUMENTFOLDER} is already present. Please choose another name or remove this folder, and run \"textallion\" again."
	pause
	create_new_lettre
else
	setup_lettre
	#cp -fr ${TEXTALLIONPATH}/includes/sample_cyoa.sty ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.sty
fi
}


## Choose type of document

choose_type_document(){
	banner
	echo "1: Create a general purpose document (book, article...)"
	echo "2: Create a letter (French A4 lettre)"
	echo "3: Create a CYOA game"
	echo ""
	echo "0: Previous menu"
	echo ""
	read ACTION
case $ACTION in
				general | "1")
					create_new_doc
					;;
				lettre|"2")
					create_new_lettre
					;;
				cyoa|"3")
					create_new_cyoa
					;;
				*|"0")
					introduction
					;;
esac
}


if [ $# -eq 0 ]
then
	test_OS
	introduction
else
extension="${file##*.}"
	case $extension in
		*.epub)
			echo "ok"
			;;
		*.t2t)
			echo "in construction"
			;;
		*)
			echo "extension inconnue ou non supportée"
			;;
	esac
fi





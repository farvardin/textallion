#!/usr/bin/env sh

# %%%% Textallion %%%%
# Tiny almost-Kiss Word Processor
# http://anamnese.online.fr/site2/textallion/docs/presentation.html
# Complete source code: https://bitbucket.org/farvardin/textallion
# License: http://creativecommons.org/licenses/by-sa/3.0/

# initiate the variables, from the user's input

alias GETTEXT='gettext "TEXTALLION"'

#TEXTDOMAINDIR=./
#TEXTDOMAIN=textallion.sh

export TEXTDOMAIN=textallion.sh
#export TEXTDOMAINDIR="/usr/share/locale"
export TEXTDOMAINDIR="/usr/share/textallion/core/locale"
#export TEXTDOMAINDIR="locale"

# change to =en or =fr for default language
export LANGUAGE=fr

PRESS_KEY=$(GETTEXT "PRESS A KEY TO CONTINUE")
CREATE_NEW=$(GETTEXT "Create a new")
MANIPULATE_SOURCE=$(GETTEXT "Manipulate sources or Generate HTML, PDF, EPUB...")
MORE_OPTIONS=$(GETTEXT "More options")
READ=$(GETTEXT "Read")
FROM=$(GETTEXT "from")
GENERATE=$(GETTEXT "Generate")
EXPORT_TO=$(GETTEXT "Export to")
EDIT=$(GETTEXT "Edit")
THIS_FOLDER=$(GETTEXT "This folder")
IS_ALREADY_PRESENT=$(GETTEXT "is already present")
PREVIOUS_MENU=$(GETTEXT "Previous menu")
AND=$(GETTEXT "and")
CREATE_INDEX=$(GETTEXT "then create an html index to distribute your files on internet")
WHO_IS_AUTHOR=$(GETTEXT "Who is the author?")
WHAT_IS_DOC_NAME=$(GETTEXT "What is the title name of the document file to be created?")
WHAT_IS_FILE_NAME=$(GETTEXT "What is the name of the game file (and folder) to be created? (Try to avoid accented letters, spaces and funky characters).")
GAME_CYOA=$(GETTEXT "CYOA game")
EXPORT_RENPY_AND_CO=$(GETTEXT "(export to renpy, undum, choicescript, create graph etc)")
CHOOSE_ANOTHER_DOC=$(GETTEXT "Choose another document to manipulate")
FIRST_TIME_USER=$(GETTEXT "It's probably the first time you're using textallion. We'll make you create a new document now.")
GAME_NOT_EXISTS=$(GETTEXT "This game is not existing, please choose another one or create a new one.")
DOCUMENT_NOT_EXISTS=$(GETTEXT "This document is not existing, please choose another one or create a new one.")
YOUR_EXISTING_GAMES=$(GETTEXT "Here are your already existing games:")
YOUR_EXISTING_DOC=$(GETTEXT "Here are your already existing documents:")
WHICH_ONE_DO_YOU_SELECT=$(GETTEXT "Which one do you select? (please type the full name, but you can omit the \"cyoa-\ or \"lettre-\" part in it if it applies.)")
GRAPH_NODES=$(GETTEXT "a graph of the nodes")
INITIATE_NEW_DOC=$(GETTEXT "This script will initiate a new document. All requested data are mandatory, except for the tags and the language code.")
MANIPULATE=$(GETTEXT "Manipulate")
OTHER_TOOLS=$(GETTEXT "other tools")
HELP=$(GETTEXT "Help")
QUIT=$(GETTEXT "Quit")
OF_DISTRIBUTED_VERSION_OF=$(GETTEXT "of the distributed version of")
WHAT_TAGS=$(GETTEXT "What are the tags defining this document (separated by commas)?")
WHAT_IS_LANGUAGE_CODE=$(GETTEXT "What is the language code of the document (2 letters, i.e. 'en' for English)?")
LETTER_DOC=$(GETTEXT "a letter (French A4 lettre)")
DOCUMENT_DOC=$(GETTEXT "general purpose document (book, article...)")


# http://stackoverflow.com/questions/2221562/using-gettext-in-bash
# xgettext -o TEXTALLION.pot  -L Shell --keyword --keyword=GETTEXT  textallion.sh
# msginit -i TEXTALLION.pot -l en.UTF-8
# msginit -i TEXTALLION.pot -l fr.UTF-8
# edit po
# msgfmt -v  en.po -o en.mo
# msgfmt -v  fr.po -o fr.mo
# install en.mo locale/en/LC_MESSAGES/TEXTALLION.mo
# install fr.mo locale/fr/LC_MESSAGES/TEXTALLION.mo
# sudo install en.mo /urs/share/locale/en/LC_MESSAGES/TEXTALLION.mo
# sudo install fr.mo /usr/share/locale/fr/LC_MESSAGES/TEXTALLION.mo
# LANGUAGE=fr  ./textallion.sh

# make a pause. Resume by keypress.
pause(){
	echo ""
	echo "($PRESS_KEY)"
	echo ""
	read -s -n 1 -p "$*"
}

banner(){
	if [[ `uname` =~ "CYGWIN" ]] ; then echo "" ; else clear
	fi
	printf "\n
 @---------------@
 / Le Textallion /
 @---------------@\n\n"
}

introduction(){
	if [[ `uname` =~ "CYGWIN" ]] ; then echo "" ; else clear
	fi
	printf "\n
 @----------------------------------------@
 / Le Textallion, a simple word processor /
 @----------------------------------------@\n\n\n"
	echo "1: $CREATE_NEW document"
	echo "2: $MANIPULATE_SOURCE"
	echo ""
	echo "3: $MORE_OPTIONS $AND $OTHER_TOOLS ($MANIPULATE $GAME_CYOA, letters, updates...)"
	echo "4: $HELP"
	echo "0: $QUIT"
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
	echo "This command-line interface is a replacement for the manipulation of a makefile. Please visit https://bitbucket.org/farvardin/textallion/ for more informations about textallion."
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
	echo "$TEXTALLIONPATH $IS_ALREADY_PRESENT on this system. We'll try to run the updater instead."
	pause
	updatetextallion
else
	echo "Textallion will be installed into $TEXTALLIONPATH: this folder will be created, then it will try to be synchronized with the development version, using Mercurial. Is it ok? (Y/n)"
		read choice
			case $choice in
					"n"|"N"|"no"|"NO"|"non")
						echo "Nothing was changed in your configuration"
						;;
					"y"|"Y"|"yes"|*)
					$SUDO mkdir -p $TEXTALLIONPATH/.hg
					echo "[paths]" | $SUDO tee -a $TEXTALLIONPATH/.hg/hgrc
					echo "default = https://bitbucket.org/farvardin/textallion/" | sudo tee -a $TEXTALLIONPATH/.hg/hgrc
					updatetextallion
						;;
			esac
fi
}


quit(){
printf "\nGoodbye :)\n\n       https://bitbucket.org/farvardin/textallion  \n  \n"
exit
}

choose_doc(){
banner
if [ -e ${TEXTALLIONDOCSPATH} ]; then
	printf "$YOUR_EXISTING_DOC \n  \n"
	#ls ${TEXTALLIONDOCSPATH}/
	# scan only for folders, and remove cyoa games and the trailing slash
	ls -p ${TEXTALLIONDOCSPATH}/ | grep "/" | sed 's@/@ @' | sed 's@cyoa-[a-z_-]*@@' | tr -d "\n"

	printf "\n\n$WHICH_ONE_DO_YOU_SELECT\n"
	echo ""
	read DOCUMENTNAME
	#export DOCUMENTNAME
		if [ -f ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME/$DOCUMENTNAME.t2t ]; then
			manipulate_doc
		else
			echo "$DOCUMENT_NOT_EXISTS"
			pause
			introduction
		fi
else
	printf "$FIRST_TIME_USER \n"
	pause
	create_new_doc
fi
}

manipulate_doc(){
	banner
	echo "1: $EDIT document $DOCUMENTNAME"
	echo ""
	echo "2: $GENERATE HTML $FROM $DOCUMENTNAME"
	echo "3: $GENERATE PDF $FROM $DOCUMENTNAME"
	echo "4: $GENERATE EPUB $FROM $DOCUMENTNAME"
	echo ""
	echo "5: $READ HTML $FROM $DOCUMENTNAME"
	echo "6: $READ PDF $FROM $DOCUMENTNAME"
	echo "7: $READ EPUB $FROM $DOCUMENTNAME"
	echo ""
	echo "8: $MORE_OPTIONS (index etc.)"
	echo ""
	echo "9: $CHOOSE_ANOTHER_DOC"
	echo ""
	echo "0: $PREVIOUS_MENU"
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
	echo "1: $GENERATE HTML, PDF $AND EPUB, $CREATE_INDEX"
	echo "2: $READ HTML index $OF_DISTRIBUTED_VERSION_OF $DOCUMENTNAME"
	echo ""
	echo "3: Synchronize $DOCUMENTNAME makefile, LaTeX style and CSS style (need a diff tool, for Linux version)"
	echo ""
	echo "5: $GENERATE a cover from the svg document (needs image-magick)"
	echo ""
	echo "9: Command-line interface to the document folder $DOCUMENTNAME (for using makefile for ex.)"
	echo ""
	echo "0: $PREVIOUS_MENU"
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
					printf "(Type ctrl-d to exit once you have finished.)\n\n"
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
	echo "1: $CREATE_NEW $GAME_CYOA"
	echo "2: $MANIPULATE $GAME_CYOA"
	echo ""
	echo "3: $CREATE_NEW $LETTER_DOC"
	echo "4: $MANIPULATE a LETTER document"
	echo ""
	#echo "6: Change default language / Modifier la langue par défault pour ce menu"
	echo "7: Try to install textallion on the system, if it's not already there"
	echo "8: Try to update textallion with the current devel version (need to be root on Linux)"
	echo ""
	echo "0: $PREVIOUS_MENU"
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
				changelang|"6")
					changelanguage
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

changelanguage(){
	banner
	echo "1: English"
	echo "2: Français / French"
	echo ""
	echo "0: $PREVIOUS_MENU"
	echo ""
	read ACTION
	case $ACTION in
		english|"1")
			export LANGUAGE=en
			echo "Language set to English"
			pause
			introduction
			;;
		french|"2")
			export LANGUAGE=fr
			echo "Langue française"
			pause
			introduction
			;;
			previous|"0")
				introduction
				;;
			*)
				changelanguage
				;;
	esac
}

create_new_doc(){
banner
printf "$INITIATE_NEW_DOC.\n\n"

echo "$WHAT_IS_FILE_NAME"
read DOCUMENTNAME

echo "$WHAT_IS_DOC_NAME"
read DOCUMENTTITLE

echo "$WHO_IS_AUTHOR"
read AUTHORNAME

echo "$WHAT_TAGS"
read DOCTAGS

echo "$WHAT_IS_LANGUAGE_CODE"
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
printf "$INITIATE_NEW_DOC\n\n"

echo "$WHAT_IS_FILE_NAME We'll add cyoa- to the title."
read DOCUMENTNAME

echo "$WHAT_IS_DOC_NAME"
read DOCUMENTTITLE

echo "$WHO_IS_AUTHOR"
read AUTHORNAME

echo "$WHAT_TAGS"
read DOCTAGS

echo "$WHAT_IS_LANGUAGE_CODE"
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
	printf "$YOUR_EXISTING_GAMES \n  \n"
	#ls ${TEXTALLIONDOCSPATH}/
	# scan only for folders beginning by cyoa-, and remove the trailing slash
	ls -p ${TEXTALLIONDOCSPATH}/ | grep "cyoa-" | sed 's@/@ @' | tr -d "\n"

	printf "\n\n$WHICH_ONE_DO_YOU_SELECT\n"
	echo ""
	read DOCUMENTNAME
	#export DOCUMENTNAME
		if [ -f ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME/$DOCUMENTNAME.t2t ]; then
			manipulate_cyoa
	    elif [ -f ${TEXTALLIONDOCSPATH}/cyoa-$DOCUMENTNAME/cyoa-$DOCUMENTNAME.t2t ]; then
			export DOCUMENTNAME=cyoa-$DOCUMENTNAME
			manipulate_cyoa
		else
			echo "$GAME_NOT_EXISTS"
			pause
			manipulate_ter
		fi
else
	printf "$FIRST_TIME_USER \n"
	pause
	create_new_cyoa
fi
}

manipulate_cyoa(){
	banner
	echo "1: $EDIT $GAME_CYOA $DOCUMENTNAME"
	echo ""
	echo "2: $GENERATE HTML $FROM $DOCUMENTNAME"
	echo "3: $GENERATE PDF $FROM $DOCUMENTNAME"
	echo "4: $GENERATE EPUB $FROM $DOCUMENTNAME"
	echo ""
	echo "5: $READ HTML $FROM $DOCUMENTNAME"
	echo "6: $READ PDF $FROM $DOCUMENTNAME"
	echo "7: $READ EPUB $FROM $DOCUMENTNAME"
	echo ""
	echo "8: $MORE_OPTIONS $EXPORT_RENPY_AND_CO"
	echo ""
	echo "9: $CHOOSE_ANOTHER_DOC"
	echo ""
	echo "0: $PREVIOUS_MENU"
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
	echo "1: $GENERATE $GRAPH_NODES"
	echo ""
	echo "2: $EXPORT_TO Ramus format"
	echo "3: $EXPORT_TO Renpy format"
	echo "4: $EXPORT_TO Hyena format"
	echo "5: $EXPORT_TO Twee/Twine format"
	echo "6: $EXPORT_TO Undum format"
	echo "7: $EXPORT_TO Choice-script format"
	echo "8: $EXPORT_TO Inform 7 format"
	echo ""
	echo "9: Command-line interface to the game folder $DOCUMENTNAME (for using makefile for ex.). "
	echo ""
	echo "0: $PREVIOUS_MENU"
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
					printf "(Type ctrl-d to exit once you have finished.)\n\n"
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
printf "$INITIATE_NEW_DOC\n\n"

echo "What is the name of the lettre file (and folder) to be created? (Try to avoid accented letters, spaces and funky characters). We'll add lettre- to the title."
read DOCUMENTNAME

echo "What is the title name of the document file to be created? "
read DOCUMENTTITLE

echo "WHO_IS_AUTHOR"
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
	printf "$YOUR_EXISTING_DOC \n  \n"
	#ls ${TEXTALLIONDOCSPATH}/
	# scan only for folders beginning by lettre-, and remove the trailing slash
	ls -p ${TEXTALLIONDOCSPATH}/ | grep "lettre-" | sed 's@/@ @' | tr -d "\n"

	printf "\n\n$WHICH_ONE_DO_YOU_SELECT \n"
	echo ""
	read DOCUMENTNAME
	#export DOCUMENTNAME
		if [ -f ${TEXTALLIONDOCSPATH}/$DOCUMENTNAME/$DOCUMENTNAME.t2t ]; then
			manipulate_lettre
	    elif [ -f ${TEXTALLIONDOCSPATH}/lettre-$DOCUMENTNAME/lettre-$DOCUMENTNAME.t2t ]; then
			export DOCUMENTNAME=lettre-$DOCUMENTNAME
			manipulate_lettre
		else
			echo "$DOCUMENT_NOT_EXISTS"
			pause
			manipulate_ter
		fi
else
	printf "$FIRST_TIME_USER \n"
	pause
	create_new_lettre
fi
}

manipulate_lettre(){
	banner
	echo "1: $EDIT lettre $DOCUMENTNAME"
	echo ""
	#echo "2: Generate HTML from $DOCUMENTNAME"
	echo "3: $GENERATE PDF $FROM $DOCUMENTNAME"
	#echo "4: Generate EPUB from $DOCUMENTNAME"
	echo ""
	#echo "5: read HTML from $DOCUMENTNAME"
	echo "6: $READ PDF $FROM $DOCUMENTNAME"
	echo ""
	echo "7: Clean folder (remove temporary files)"
	echo ""
	echo "8: More options (none at the moment)"
	echo ""
	echo "9: $CHOOSE_ANOTHER_DOC"
	echo ""
	echo "0: $PREVIOUS_MENU"
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
printf "`date +%Y-%m-%d`\n\n\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
printf "%%%% DEF DOCUMENT METADATA. Use your own. Remplace the second part only, don't modify the xx DOCUMENT ## xx \n\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
printf "%%\041postproc(tex): 'xx DOCUMENT TITLE xx' '${DOCUMENTTITLE}'\n\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
printf "%%\041postproc(tex): 'xx DOCUMENT AUTHOR xx' '${AUTHORNAME}'\n\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
printf "%%\041postproc(tex): 'xx DOCUMENT TAGS xx' '${DOCTAGS}'\n\n\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
printf "%%\041style(tex): ${DOCUMENTFOLDER}.sty\n\n" >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
printf "%%\041style(xhtml): ${DOCUMENTFOLDER}.css\n\n\n" >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
printf "%%\041includeconf: ${TEXTALLIONPATH}/core/textallion.t2t\n\n" >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
printf ${CYOASTATUS} >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
printf "%%\041postproc(tex): 'TEXTALLIONPATH' '${TEXTALLIONPATH}'\n\n\n" >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo  ${CYOAINIT} >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t

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
printf "`date +%Y-%m-%d`\n\n\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t

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


printf "%%%% DEF DOCUMENT METADATA. Use your own. Remplace the second part only, don't modify the xx DOCUMENT ## xx \n\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t

printf "%%\041postproc(tex): 'xx DOCUMENT TAGS xx' '${DOCTAGS}'\n\n\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t

if [ -f ${TEXTALLIONDOCSPATH}/signature.txt ]; then
	echo "We use your default signature"
	cat ${TEXTALLIONDOCSPATH}/signature.txt >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
else
	printf "\n\nYou don't have a default signature, so we create one in \n" ${TEXTALLIONDOCSPATH}
	printf "\n\n"
	cp ${TEXTALLIONPATH}/templates/signature.txt ${TEXTALLIONDOCSPATH}/signature.txt
	cat ${TEXTALLIONDOCSPATH}/signature.txt >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
fi

printf "\n\n" >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t

printf "%%\041postproc(tex): 'xx DOCUMENT RECIPIENT GENDER xx'          'Madame'\n\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
printf "%%\041postproc(tex): 'xx DOCUMENT RECIPIENT xx'                 '\\\textsc{Mélanie Farjot}'\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
printf "%%\041postproc(tex): 'xx DOCUMENT RECIPIENT STREET xx'          '1, rue Maréchal Livolas'\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
printf "%%\041postproc(tex): 'xx DOCUMENT RECIPIENT POSTAL CODE xx'     '77223'\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
printf "%%\041postproc(tex): 'xx DOCUMENT RECIPIENT TOWN xx'            'Villedaim'\n\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
printf "%%\041postproc(tex): 'xx DOCUMENT RECIPIENT PHONE xx'           'Tél : 41 83 53 54 22'\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
printf "%%\041postproc(tex): 'xx DOCUMENT RECIPIENT FAX xx'             'Fax : 41 83 53 54 43'\n\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t

printf "%%\041postproc(tex): 'xx DOCUMENT TITLE xx' '${DOCUMENTTITLE}'\n\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t

printf "%%\041postproc(tex): '%%\\\\date{}' '\\\\date{le 9 mars 2012}'\n\n"   >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t



printf "%%\041style(tex): ${TEXTALLIONPATH}/includes/sample.sty\n\n" >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
# printf "%!style(xhtml): ${DOCUMENTFOLDER}.css\n\n\n" >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
printf "%%\041includeconf: ${TEXTALLIONPATH}/core/textallion.t2t\n\n" >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo ${CYOASTATUS} >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
printf "%%\041postproc(tex): 'TEXTALLIONPATH' '${TEXTALLIONPATH}'\n\n\n" >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t
echo ${CYOAINIT} >> ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t

echo "${DOCUMENTFOLDER} was created into the textalliondocs folder in your home. You can modify it from here and generate the target documents with this menu driven command line. (You can also enter this folder, edit ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER}/${DOCUMENTFOLDER}.t2t with the text editor of your choice, and in order to generate the final documents, type \"make pdf\" or \"make html\" or \"make epub\"...)"
pause
}


## TESTS

test_folder(){
if [ -e ${TEXTALLIONDOCSPATH}/${DOCUMENTFOLDER} ]; then
	echo "$THIS_FOLDER ~/${DOCUMENTFOLDER} $IS_ALREADY_PRESENT. Please choose another name or remove this folder, and run \"textallion\" again."
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
	echo "$THIS_FOLDER ~/${DOCUMENTFOLDER} is already present. Please choose another name or remove this folder, and run \"textallion\" again."
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
	echo "1: $CREATE_NEW $DOCUMENT_DOC"
	echo "2: $CREATE_NEW $LETTER_DOC"
	echo "3: $CREATE_NEW $GAME_CYOA"
	echo ""
	echo "0: $PREVIOUS_MENU"
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

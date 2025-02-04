#
# makefile to generate an inform game from the command-line
#


#/usr/local/share/inform7/Compilers/ni

INFORMPATH1=/usr/local/share/inform7/Inform7/
INFORMPATH2=/usr/share/gnome-inform7/
INFORMPATH3=./

INFORMCOMPILERS1=/usr/local/share/inform7/Compilers/
INFORMCOMPILERS2=/usr/lib/gnome-inform7/gnome-inform7/
INFORMCOMPILERS3=compilers/



INFORMPATH=$(INFORMPATH3)
INFORMCOMPILERS=$(INFORMCOMPILERS3)
GAME=cyoa
GAMEFULLNAME=cyoa
EDITOR=geany
TERP=gargoyle-free

make z8:
	$(INFORMCOMPILERS)/ni \
	-rules $(INFORMPATH)/Extensions -extension=z8 -package $(GAME).inform
	# -kw~S~Dv8
	$(INFORMCOMPILERS)/inform-6.32-biplatform \
	-wxE2~S~Dv8 $(GAME).inform/Build/auto.inf $(GAME).z8
	cp $(GAME).z8 $(GAME).inform/Build/output.z8
	#
	$(INFORMCOMPILERS)/cBlorb \
	-unix $(GAME).inform/Release.blurb $(GAME).z8
	rm -fr gameinfo.dbg
	- cp $(GAME).z8 "$(GAME) Materials/Release/$(GAMEFULLNAME).zblorb"
	- cp -fr "$(GAME) Materials/Figures/"* "$(GAME) Materials/Release/"
	#- cp -fr media_src/*.ttf "$(GAME) Materials/Release/"

make zdebug:
	$(INFORMCOMPILERS)/ni \
	-rules $(INFORMPATH)/Extensions -extension=z8 -package $(GAME).inform
	#
	$(INFORMCOMPILERS)/inform-6.32-biplatform \
	-wxE2kSDv8 $(GAME).inform/Build/auto.inf $(GAME).z8
	#
	rm -fr gameinfo.dbg

make glulx:
	$(INFORMCOMPILERS)/ni \
	-rules $(INFORMPATH)/Extensions -extension=ulx -package $(GAME).inform -release
	#
	$(INFORMCOMPILERS)/inform-6.32-biplatform \
	-wxE2~S~DG $(GAME).inform/Build/auto.inf $(GAME).inform/Build/output.ulx
	#
	$(INFORMCOMPILERS)/cBlorb \
	-unix $(GAME).inform/Release.blurb $(GAME).gblorb
	
make edit:	
	$(EDITOR) $(GAME).inform/Source/story.ni
	
make play:
	$(TERP) $(GAME).z8

make deploy:
	echo "We install the required extensions and templates in ~/Inform"
	-cp -fr Extensions/* ~/Inform/Extensions/
	-cp -fr Templates/* ~/Inform/Templates/
	

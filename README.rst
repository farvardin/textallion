######################################
Le TeXtallion, a simple word processor
######################################

******
Basics
******

Textallion is a document generator, designed to output HTML, PDF and EPUB formats.

Please read the documentations in the ./docs folder; these are normal txt files and should be self-explanatory:


- documentation_en.t2t is for the English version (it's a normal txt file)
- documentation_fr.t2t is for the French version

- textallion_cyoa_en.t2t is for the Gamebook (CYOA) module
- textallion_cyoa_fr.t2t is for the Gamebook module (French version)

You need python 2 to use this program and LaTeX to be able to generate
pdf files.

You can run textallion_install.sh to install everything into /usr/share/textallion
or just run the makefile from the sample folder to get started.

Type:


    - "make html" to generate the html manual for English
    - "make pdf" to generate the pdf version (requires LaTeX)
    - "make xetex" to generate an alternative pdf version (requires XeTeX)
    - "make epub" to generate an epub document (requires Calibre)

Edit the makefile and change "DOCUMENT = sample_en" to 
"DOCUMENT = sample_fr" in order to generate the French version of those 
documents.

You can also run core/textallion.sh (or just 'textallion' if you've already
used the installation script) for a little front-end.


**************************
Source Code and bug report
**************************

http://code.google.com/p/textallion/


*******************
License and credits
*******************

----------

All textallion code and hacks are released under the `BSD license <http://en.wikipedia.org/wiki/BSD_licenses>`_

{ -- }

::

  Copyright (c) 2008-2014, Eric Forgeot. 
  All rights reserved.
   
  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
      * Redistributions of source code must retain the above copyright
        notice, this list of conditions and the following disclaimer.
      * Redistributions in binary form must reproduce the above copyright
        notice, this list of conditions and the following disclaimer in the
        documentation and/or other materials provided with the distribution.
      * Neither the name of the <organization> nor the
        names of its contributors may be used to endorse or promote products
        derived from this software without specific prior written permission.
   
  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY
  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

{/-- }

----------

All personal artwork and documentation, if applicable, are licensed under the `CC-BY-SA <http://creativecommons.org/licenses/by-sa/3.0/>`_ license.

----------

You can contact me about Textallion:


- on the discussion-list: http://groups.google.com/group/textallion-discuss
- on the bug-tracker: http://code.google.com/p/textallion/issues/list
- using this form there: http://anamnese.online.fr/site2/index.php?id=contact

----------

Textallion uses `txt2tags <http://txt2tags.org/>`_ as a backend. Txt2tags is covered by the GNU GPL.

----------

Credit is due to:


- Aurelio Jargas and the `txt2tags <http://txt2tags.org/>`_ team, 
- Kovid Goyal for `Calibre <http://calibre-ebook.com/>`_
- nycosweb on Linuxfr for the new name inspiration
- Christophe Chailloleau-Leclerc for the help with the adventurebook perl script 
- Hans Henderson for the help with some translations
- all contributors to TeX, LaTeX, the W3C standards etc.
- "Tout ce que vous avez toujours voulu savoir sur LaTeX sans jamais oser le demander" par Vincent Lozano (édition framabook / In Libro Veritas)
- http://www.grappa.univ-lille3.fr/FAQ-LaTeX/6.7.html
- Html footnote effect taken from http://andreas.web-graphics.com/footnotes
- Qr-Code generator from http://blog.strangeblackhole.com/Un-QR-Code-sur-mon-blog-avec.html
- `Inno Setup <http://www.jrsoftware.org/isinfo.php>`_ for the windows installer
- http://www.auntiepixelante.com/twine/ for the help with the twine syntax
- http://www.mcdemarco.net/ for the twee patch

20140819


*********
Changelog
*********

*The release filenames are in the form: textallion_year-month-day_artistname.zip. If some additions are made during the same month, there won't be a full release with a new artist's name, but the update's filename will show a new date, for example:  textallion_2010-08-13_chasseriau.zip and then textallion_2010-08-15_chasseriau.zip*


- 2014:

 - `Paul Delaroche <https://fr.wikipedia.org/wiki/Paul_Delaroche>`_ release:

                - various bugfixes

- 18 nov 2013:

 - `Léonide Bourges <https://fr.wikipedia.org/wiki/L%C3%A9onide_Bourges>`_ release:

                - CYOA: fixed bold, monospace and image syntax in twee.
                - CYOA: fixed many things in the twee (twine) export so it will work with named chapters 
                - CYOA: adding new syntax to allow named chapters: [#name] and simpler numbered chapters: [#number] instead of [number #number]
                - PDF: Fixed some latex display problems.
                - updated windows installer



- 28 july 2013:

 - `Suzanne Valadon <https://fr.wikipedia.org/wiki/Suzanne_Valadon>`_ release:

                - New syntax for a boxed area. 
                - CYOA: updated twee. 
                - HTML: small tweak to the CSS.
                - PDF: added microtype feature in LaTeX.
                - PDF: fixed French guillemets in the Lettre template
                - PDF: fixed the TOC in French even for English documents
                - PDF: fixed the headnote which was only displaying "TABLE OF CONTENT" everywhere
                - SHELL: with pdfjam we can remove extra page in the letter template ("make lettre-1page")



- 22 nov 2012:

 - `Pierre Puvis de Chavannes <http://en.wikipedia.org/wiki/Pierre_Puvis_de_Chavannes>`_ release:

                - CYOA: fixed twee, added undum and choicescript. Separated doc for CYOA.
                - SHELL (textallion.sh): submenu for new cyoa systems
                - improved exponent. Added subscript.



- 27 june 2012:

 - `Félicien Rops <http://en.wikipedia.org/wiki/F%C3%A9licien_Rops>`_ release:

                - EPUB: updated CSS, and various adjustement to visually match the pdf version
                - HTML/EPUB: added htsplit (not used yet)
                - HTML: nicer output with smaller toc and colored h2 and h3
                - PDF: fixed table break by page (using tabular), added instructions to use text wrap in columns. 
                - SHELL (textallion.sh): submenu for new document: general doc, letter or cyoa 
                - fixed centered tables with blank space before pipe.



- 20 apr 2012:

 - `Odilon Redon <http://en.wikipedia.org/wiki/Odilon_Redon>`_ release:

                - EPUB: added variable for epub info
                - PDF: fixed various TeX errors
                - PDF: added "lettre" template for writing letters in French
                - PDF: improved general heading appearance (centered, bigger fonts)
                - CYOA: updated Ramus output.
                - English docs were improved, and various other corrections.

- 24 july 2011:

 - `Cléo de Mérode <http://en.wikipedia.org/wiki/Cl%C3%A9o_de_M%C3%A9rode>`_ release:

                - CYOA: Added inform 7 support
                - Added sound and video using HTML5 (ogg vorbis/theora)
                - Corrected quickref document

- 11 june 2011:

 - `Georges Seurat <http://fr.wikipedia.org/wiki/Georges_Seurat>`_ release:

                - CYOA: improved the renpy output (images, end of game)
                - CYOA: added Ramus HTML rendering (http://felix.plesoianu.ro//index.php/page:Software:Ramus)
                - .desktop file (for unix desktops)

- 27 mai 2011:

 - `Paul Signac <http://fr.wikipedia.org/wiki/Paul_Signac>`_ release:

                - CYOA: Now textallion can use txt2cyoa for generating HTML, PDF and EPUB gamebooks.
                - CYOA: fade in js effect when displaying new chapter.
                - CYOA : tweecode, hyena and renpy export
                - New logo

- 31 mar 2011:

 - `Édouard Vuillard <http://fr.wikipedia.org/wiki/%C3%89douard_Vuillard>`_ release:

                - Now use templates.
                - Added a SVG sample cover (can generate a personalised png cover with imagemagick)
                - PDF: Fixed wrapping images within paragraphs, using the fp latex package.
                - PDF: now the metadata are defined into the t2t document, not the style.sty file.
                - PDF: adding xetex backend (``make xetex``).
                - PDF: Now the "book" document class is default, with Part, Chapter, Section.
                - Created a windows installer using Inno Setup.
                - Updated most LaTeX variables, because underscore was not recognised by LaTeX.
                - Updated textallion.sh, now can handle updates, installation etc.



- 27 feb 2011:

 - `Charles-François Daubigny <http://fr.wikipedia.org/wiki/Charles-Fran%C3%A7ois_Daubigny>`_ release:

                - Double brackets option for links.
                - LaTeX equations.
                - Index symbol.
                - Corrected the line break markup.
                - Corrected CSS for a better rendering.
                - Corrected table of content for EPUB output.
                - Updated doc.
                - Moved txt2tags to a contrib section
                - Use of `webfonts <http://www.google.com/webfonts>`_.
                - Auto generation of a homepage with links to the html, pdf, epub and qr-code.
                - make configuration-update to diff between the latest textallion install and your makefile, css and sty project files.
                - Improved initialisation script (textallion.sh).



- 30 dec 2010:

 - `Alexandre-Hyacinthe Dunouy <http://en.wikipedia.org/wiki/Alexandre-Hyacinthe_Dunouy>`_ release:

                - New symbols for adding italic and bold area
                - New symbol for adding page break
                - Real footnotes effect for html (css3)
                - Epigraph style
                - French guillemets symbols
                - French doc improved
                - Code markup
                - Line break
                - A script for creating a new skeleton project.

- 30 nov 2010:

 - `Jean-Auguste-Dominique Ingres <http://en.wikipedia.org/wiki/Jean_Auguste_Dominique_Ingres>`_ release:

                - Updated to latest txt2tags 2.6 (and "2.7" devel) 
                - New target: slidy, from txt2tags upstream, for making html presentations (using js)
                - New reorganisation of the folders
                - Now the CSS file are included by default, to be more easily portable (this behavior can be changed in the makefile if needed)
                - New symbols for changing the size of the text (only 3 alternatives, normal, bigger, smaller)

- 13 oct 2010:

 - `Gustave Moreau <http://en.wikipedia.org/wiki/Gustave_Moreau>`_ release:

                - Added columns options
                - Added a quick reference cheatsheet
                - Fixed some bugs (sub-lists)

- 21 aug 2010: 

 - `Théodore Chassériau <http://en.wikipedia.org/wiki/Th%C3%A9odore_Chass%C3%A9riau>`_ release: 

                - Corrected line break (added noindent) for LaTeX, when using a space at the beginning of a line.
                - Added non-breaking space symbol
                - Added page break for new section (heading 1) in LaTeX
                - Reorganised samples documents (a new document with all examples was separated from the manual) 
                - User may use some unicode symbols directly into the source code (instead of the symbolised version)
                - Non supported symbols in the epub version are replaced by stars
                - Can use the environment variable TEXTALLIONDOC in the makefile
                - Corrected the initial letters for the CSS
                - Separated changelog and license info into external documents.

- 08 jul 2010: 

 - `Marcellin Desboutin <http://fr.wikipedia.org/wiki/Marcellin_Desboutin>`_ release: 

                - Changed the symbol representations to a more consistent one (4 signs between braces), with less possibility for a clash with existing texts.
                - Fixed page numbering in pdf so it won't be displayed on the first page cover.

- 25 apr 2010:

 - `Théodore Géricault <http://en.wikipedia.org/wiki/Th%C3%A9odore_G%C3%A9ricault>`_ release:

                - Better display for the epub version (fixed alignment and margins)

- 20 mar 2010:

 - `Douanier Rousseau <http://en.wikipedia.org/wiki/Henri_Rousseau>`_ release:

                - Support for colors in html and LaTeX

- 23 feb 2010: 

 - `Daumier <http://en.wikipedia.org/wiki/Honor%C3%A9_Daumier>`_ release:

                - Update of the makefile for use with the latest Calibre
                - Support for image size information
                - Simplification and improvement of the style for the html css               
                - Use of a code name for the releases (`French/European painters or artists from the 19ème century <http://fr.wikipedia.org/wiki/Liste_de_peintres_fran%C3%A7ais#XIXe_si.C3.A8cle>`_)

- 24 dec 2009: 

                - Beginning of a support for packaged version in a system-wide installation
                  (/usr/share/textallion)
                - A few bugfixes and additions.

- 20 nov 2009: 

                - Project renamed from "txt2tex" to "Le TeXTallion", 
                - Thanks to nycosweb, ffx and the linuxfr readers for the inspirations.

- 15 nov 2009: 

                - Better support for centered text for writing poetry. 
                - Fix for allowing to create a table of content in the pdf output.

- 28 jun 2009: 

                - now the core engine and the samples are separated so it looks more like a real project.
                - Added epub output in the makefile.

- 06 jan 2009: a few bugfixes

- 24 dec 2008: initial release


*******************
Todo and known bugs
*******************


Syntax, backend and docs
========================


- use of [[description | www.link.com]]
- Syntax for creating references, to be inserted into an index at the end
- pb indents
- a graphical GUI for conversion (a simple tk interface?), and a graphical GUI for edition (based on `RedNotebook <http://rednotebook.sourceforge.net/>`_ or `SciTE <http://www.scintilla.org/SciTE.html>`_ for example?). Or a Qt Gui with some kparts using the kate syntax. Something based on http://qapote.tuxfamily.org/ or http://latexila.sourceforge.net/
- When using UTF-8, ensure it's not using UTF-8 with BOM, otherwise the first bytes of the document may get extra characters and it will modify the title, adding something not interpretable with LaTeX, with this kind of error for example: "Unicode char \u8: not set up for use with LaTeX.". 
- English doc is lagging behind the French one.
- Lettrine + French apostrophe
- Lettrine + capital accented letters (À)
- script textallion.sh: update config (makefile)
- create an updater for the windows version
- create desktop icon (start a term if it's launched from the menu)
- rename the "images" folder to "media" (now there is music in it)
- add syntax:  turn to, go to, (turn to ###) etc
- special syntax for warning {<!>} and information {<i>}


HTML
====


- Use templates for html
- Using an embeded free font, like Gentium Basic?
- hidden menu adding link to read the text in 

 - https://www.readability.com/bookmarklets 
 - or http://www.tidyread.com/widget.html ?

- Find more ideas from 

 - http://epubzengarden.com/ 
 - http://librairie.immateriel.fr/ (`example <http://librairie.immateriel.fr/fr/read_book/9782212128611/chap02>`_)
 - and from http://typekit.com/ ?

- support for http://labs.cavorite.com/presentacular

- In midori and android browser the webfont is not displaying aldine leaves and such. (ok in other webkit engines such as chromium)

- footnotes not yet in the slidy version
- In webkit, when clicking a footnote it will scroll down a bit.

- Wrapping + text modification (for ex. reduce size) are not working
- Wrapping is not working on the Android browser (looks like fixed width)
- Slidy menu are too big


PDF (LaTeX and XeTeX)
=====================


- Use templates for LaTeX
- More templates, for different languages. 
- Fix the TOC in French even for English documents
- Improving templates for LaTeX, especially the xetex version
- Monospaced content in xetex
- It's not possible to include a .sty file from internet (latex limitation?)
- When using a depth of 4 in the TOC, the title doesn't display (textallion.sty).
- Use book style by default in the future.
- differentiate odd and even pages.
- beamer is broken (doesn't work as expected, needs rework)
- long links don't reflow to a new line
- can't use both lettrine & wrap image 
- section headnote are in UPPERCASE and it's ugly (see markright)

- note : if you want to separate chapters on different pages, use "book". If you want to write a memo with every parts alltogether to save space, use "article". Important: article won't support "chapters", so they will be ignored and break the hierarchy you could have made. Use the replacements proposed at the beginning of new documents.


EPUB
====


- Extra unwanted entries in TOC, such as footnotes and linked documents
- Epub files looks bad with FBReader desktop edition (but ok in Calibre)
- decorations are not centered as expected


Windows
=======


- Easier updates


txt2cyoa
========


- Clean and simplify the js code for fading
- Renpy output
- renpy: check use of " === , - and big space
- undum output?
- Add sound support
- Ramus: works for numbered chapter, but not for named ones (will work with named == chapter == with the [#name] or [description|#name] syntax, not with == 5 ==[name])
- Ramus: Dice will scroll up 
- Ramus: footnotes don't work.

.. rst code generated by txt2tags 2.6.804 (http://txt2tags.org)
.. cmdline: txt2tags -t rst -o ../README.rst readme.t2t

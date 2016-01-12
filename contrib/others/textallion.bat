REM batch file for using with textallion
REM http://textallion.googlecode.com

set TEXTALLIONPATH=C:\temp\textallion
set PYTHONPATH=C:\Python27
set MIKTEXPATH="C:\Program Files\MiKTeX 2.8"


@echo off
:debut
cls
echo.
echo -----------------
echo  Textallion menu
echo -----------------
echo.
echo What is the name of your document? (without the .t2t extension)
set INPUT=
set /P INPUT=Enter the name please : %=% 
echo.
echo 1 - Generate HTML:  %INPUT%.html from %INPUT%.t2t
echo 2 - Generate PDF:  %INPUT%.pdf (LaTeX) from %INPUT%.t2t 
echo 3 - Generate EPUB:  %INPUT%.epub from %INPUT%.t2t 
echo q - Quit
echo.
echo.
set choice=
set /p choice=Your choice ? 
if not '%choice%'=='' set choice=%choice:~0,1%
if %choice%==q goto fin
if %choice%==3 goto lancer_epub
if %choice%==2 goto lancer_pdf
if %choice%==1 goto lancer_html

:lancer_html
%PYTHONPATH%\python.exe %TEXTALLIONPATH%\core\txt2tags -t xhtml --css-inside --toc --outfile %INPUT%.html %INPUT%.t2t
goto fin
:lancer_pdf
%PYTHONPATH%\python.exe %TEXTALLIONPATH%\core\txt2tags -t tex --toc --outfile %INPUT%.tex %INPUT%.t2t
%MIKTEXPATH%\miktex\bin\pdflatex.exe -interaction batchmode %INPUT%.tex
%MIKTEXPATH%\miktex\bin\pdflatex.exe -interaction batchmode %INPUT%.tex
goto fin
:lancer_epub
%PYTHONPATH%\python.exe %TEXTALLIONPATH%\core\txt2tags -t xhtml --css-inside --toc --outfile %INPUT%.html %INPUT%.t2t
"C:\Program Files\Calibre2\ebook-convert.exe" %INPUT%.html %INPUT%.epub --max-levels 0 --pretty-print --level1-toc //h1 --level2-toc //h2 --level3-toc //h3 --toc-threshold 4 --chapter //chapitre --chapter-mark pagebreak  --extra-css %INPUT%.css
goto fin
:fin
pause

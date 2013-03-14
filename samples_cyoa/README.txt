     ####################################
     #  txt2cyoa, a simple CYOA maker   #
     ####################################

by Eric Forgeot (c) 2007-2009

Licensed under a CC-By-SA licence
http://creativecommons.org/licenses/by-sa/3.0/



Play a sample 
=============

http://anamnese.online.fr/site2/txt2cyoa/samples/sample.html
or 
http://anamnese.online.fr/site2/txt2cyoa/samples/who_are_you.html

short URL: http://3.ly/txt2cyoa

Basics
======

Create "Choose your own Adventure" games with Txt2Tags (txt2CYOA)
(French translation below / Traduction française plus bas)

Requirement : 
-----------

python and optionally tex + pdflatex (use texlive for ex.) 
and graphviz, pdfjam (pdfnup)

For using the template, you just need to create an additionnal txt2tags 
file with sections using for ex. :

== z ==

To create a choice, use either :
- Description of the choice : z
- Description of the choice : [z #z]. More words afterwards.

with z being replaced by the number of your section. 
You must use the syntax [z #z] if the number is followed by something 
and not alone at the end of the line.

You can also add more descriptive links with :

== z ==[name_of_link]

and the call to this chapter would be :

- Go to this chapter : [z #name_of_link]

You can add pictures with [yourpicture.jpg] (or .png)
To used wrapped pictures, use wrap=[yourpicture.jpg]=wrap

It's also possible to expand the html game with one chapter on one html 
file.
For the general syntax, further tips and requirement for txt2tags, 
please go to : 

   http://txt2tags.org

For choosing between tex (pdf) and html, just comment and uncomment 
one of the 2 sections below beginning with "!target" and invoque 
the file with " txt2tags yourgame.t2t ". 

For creating the pdf use " pdflatex yourgame.tex ".

More easily, you can use the makefile included, if you have access to 
the make command (unix system).
On mswindows, you can use cygwin http://www.cygwin.com/ for such 
advanced programming tools.

You can also change your tex style and replace or modify 
cyoa_A4.sty or cyoa_dayromanA4.sty
(see the two lines after MORE OPTIONS and / or !style(tex))
Please note in the second example you'll need the tex font dayroman.

It's possible to get a graph with all the chapters connected together.
You need to have graphviz installed to do that, and make sure each 
choice starts on one individual line, with a - and ends with the number 
of the choice.

Again, the best is to use a Unix environment, and invoque 
"make all" in order to generate the html, pdf versions and the graph in 
svg and png as well.

  

%%%Traduction française :
Créer des "livres dont vous êtes le héros" avec Txt2Tags (txt2CYOA)

Outils nécessaire : python éventuellement tex + pdflatex (utiliser 
texlive par ex.) et graphviz pour les schémas

Pour utiliser ce modèle, il suffit de créer un nouveau fichier txt2tags
et d'ajouter des paragraphes avec cette syntaxe :

== z ==

Pour créer un choix on peut utiliser ces 2 formules :
- Description du choix : z
- Description du choix : [z #z]. Et quelques mots ensuite.

avec z symbolisant le numéro de votre paragraphe.
Il est obligatoire d'utiliser la syntaxe [z #z] si le nombre est suivi 
de quelque chose et n'est pas tout seul à la fin de la ligne.

Il est également possible d'avoir des liens plus imagés avec (sans 
espace) :

==z==[nom_du_lien]

et l'appel à ce paragraphe serait :

- Aller à ce paragraphe : [z #nom_du_lien]

Vous pouvez ajouter des images avec [votreimage.jpg] (ou .png)
Pour utiliser des images incluses dans le texte, on peut utiliser
la syntaxe wrap=[votreimage.jpg]=wrap

Il est également possible d'avoir un paragraphe par fichier html.
Pour en apprendre plus sur les options et la syntaxe générale de txt2tags, 
il y a des manuels sur : http://txt2tags.org

Pour choisir entre tex (pdf) et html, 
il suffit de commenter une des deux sections commençant par "!target"
et d'invoquer le fichier avec " txt2tags txt2cyoa.t2t ". 
Pour générer le pdf il faut utiliser : " pdflatex txt2cyoa.tex ".

Vous pouvez également modifier le style tex 
cyoa_A4.sty ou cyoa_dayromanA4.sty
(voir les deux lignes après MORE OPTIONS et/ou !style(tex))
Dans le second exemple il vous faudra installer la police de caractère 
dayroman avec LaTeX

Enfin, il est possible d'obtenir un organigramme avec tous les chapitres 
reliés entre eux.
Il faut le programme graphviz pour cela, et veuillez à bien débuter les 
options possibles avec un tiret et de terminer chaque ligne par le 
chapitre choisi.
Le plus simple est d'utiliser un environnement Unix et de taper 
"make all" pour obtenir directement les versions html et pdf 
ainsi que l'organigramme en png et svg.



Changelog
=========

- 30 aug 2009 : added support for folding chapters which are not read 
                in html
- 07 dec 2008 : a few bugfixes
- 17 jul 2007 : initial release

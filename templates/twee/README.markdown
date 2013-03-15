README : tweecode/twee
======

To run twee, you will need a copy of this code, a local Python installation, and a .tw file.  You can get this fork from github using, for example, the ZIP button.  Python should come pre-installed on a Mac; a Windows installer is available at [python.org](http://www.python.org/getit/).  You can find some sample twee files at [gimcrackd.com](http://gimcrackd.com/).

Once you have all those, open the Terminal or a command prompt, change to the twee directory, and type something like:

    ./twee my-input-file.tw > my-output-file.html

To compile to a specific target, use the -t flag:

    ./twee -t sugarcane my-input-file.tw > my-other-output-file.html

There is no longer a default target.  Omitting the target results in a very simple default layout.

Customization
=============

The targets/local directory is intended for local configuration.  Add any desired css directives to the css file.  Add new macros to the js file.  There are three files to which HTML can be added:  head.html, for header lines (such as a reference to an external stylesheet), body.html for formatting the body of the story (including sidebars and changes to the title text layout), and foot.html for any elements that should appear after the story text.

You can also make a copy of targets/local or of one of the other directories in targets to base a new target layout on an existing one.

Please be careful to back up any target changes before downloading a new version of twee.  There is no mechanism here to prevent overwriting of edited files.

***

See the [twee documentation](http://gimcrackd.com/etc/doc/) for more information about twee.  

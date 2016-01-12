# You can place the script of your game in this file.

# Declare images below this line, using the image statement.
# eg. image eileen happy = "eileen_happy.png"

# Declare characters used by this game.
define n = Character('Narrator', color="#c8ffc8")

init:

    # Lower the music volume by 1/3
    $ renpy.music.set_volume(0.67, .5, channel="music")
    
    image bg = "bg.jpg"
    
    init python:
        centertop = Position(xalign=0.5, yalign=0.2)
        centerleft = Position(xalign=0.05, yalign=0.2)
        fulltop = Position(xalign=0.5, yalign=0.0)
        
        def showmypic(mypic):
            renpy.show(mypic, [centertop])
            renpy.with_statement(dissolve)


        def hidemypic(mypic):
            renpy.hide(mypic)
            renpy.with_statement(dissolve)
            
        dissolve = Dissolve(0.5)
            


# The game starts here.
label start:

    scene bg
    n "You've created a new Ren'Py game."

    n "Once you add a story, pictures, and music, you can release it to the world!"
    
    menu:
        "Start the game":
            jump page1


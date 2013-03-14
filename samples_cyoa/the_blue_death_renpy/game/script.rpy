# You can place the script of your game in this file.

# Declare images below this line, using the image statement.
# eg. image eileen happy = "eileen_happy.png"

# Declare characters used by this game.
define n = Character('Narrator', color="#c8ffc8")

init:
    image bg = "bg.jpg"
    image the_blue_death = "the_blue_death.jpg"
    
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






label page0:
    scene bg
    with None

    
    $ showmypic("the_blue_death") 



    menu:
        " Start the game":
            jump page1






label page1:
    scene bg
    with None

    "I'm falling down. Not very far from the “ground”, fortunately for me. Some thick, heavy ropes are softening my falling. I've probably missed my step, because I'm absent-minded most of the time now."

    menu:
        " Stand up":
            jump page19



label page2:
    scene bg
    with None

    "As soon as I enter the big building, some officiers catch me, for the reason of escaping a residence I was supposed to stay in, having been legally bought by Mr and Mrs Caesar."
    menu:
        " Despite my protests, I am sent to jail":
            jump page48




label page3:
    scene bg
    with None

    "They are a bunch of six mariners. They're just having fun after all."
    menu:
        " But I can give them a fair correction":
            jump page23
        " Or I can crawl back to the safety of the upper deck":
            jump page5




label page4:
    scene bg
    with None

    "I ring the bell at the door. Beatrix doesn't seem very happy to see me. She was a good friend of mine before, so I don't understand her new reluctance."
    "She wears a pretty, light, white and gray dress, and I sense such poetry in the air that I want to tell her about what I have in my mind."
    menu:
        " Be rude, but direct":
            jump page35
        " Be soft, but verbose":
            jump page28




label page5:
    scene bg
    with None

    "This deck is usually reserved to the first-class passengers. I hope some officers won't notice me or I'll be in great trouble."
    "I've got this job on a ship to pay my travel to the Great Continent, which had been rediscovered only a few centuries ago. Meanwhile, I've always been curious about the life there, to discover if people were like us or if their culture was far too exotic to be able to live far over there. I've also tried to learn bits of their difficult language, and forced myself to use it on a daily basis. So I moved to Iricimia, which has a similar language, and even if I still don't master it, I lived there for a while, then decided to embark on this ship."
    menu:
        " After some time, we arrive to New Londrin Haven, and I enter the city triumphally":
            jump page25
        " But before that, I could explore the haven a bit, adding less prestige to my arrival":
            jump page27




label page6:
    scene bg
    with None

    "We enter a snobbish tea-house, in a touristic area. We quickly get bored in this place, so I propose we search a more pleasant place to entertain ourselves."
    menu:
        " Propose her appartment":
            jump page42
        " Propose my appartment":
            jump page38
        " Propose to get an ale in the nearby tavern":
            jump page7



label page7:
    scene bg
    with None

    "Entering the tavern, I see some of my former comrades from the ship. Surprisingly, they are not that much hostile to my presence. We take a beer together, then an other, and I end the night dancing on the tables, to the great joys of the maids here who are clapping their graceful hands in rhythm."
    "I appreciate this simple life, and no longer fear the blue terror I used to feel in the past."
    jump end 






label page8:
    scene bg
    with None


    "Am I lucky today? (throwing a dice, 5 or 6 means luck)"

    menu:
        " If I'm lucky":
            jump page18
        " If I'm not lucky":
            jump page51




label page9:
    scene bg
    with None

    "The opposition is full of nice persons, however, I can't garantee the leaders are politically clean. Some people claims they're even infiltrated by the Indigo Love Syndicate."
    "Am I lucky today? (throwing a dice, 5 or 6 means luck)"

    menu:
        " If I'm lucky":
            jump page32
        " If I'm not lucky":
            jump page49




label page10:
    scene bg
    with None

    "The docks are not a pleasant place for a delicate person like me. I get the feeling that I may become an easy prey for most of the vultures here. I notice a handsome woman waiting on the pier. Some sailors I met on the ship are calling me, while entering a tavern."
    menu:
        " Approach the lady":
            jump page37
        " Follow my previous comrades into the tavern":
            jump page7
        " Come back home":
            jump page31



label page11:
    scene bg
    with None

    "Impassive to the human's emotions, the ship is reaching the morning mists of the other continent. Setting my foot on the pier for the first time after three weeks of spiritual torture, I feel dizzy and completely at loss. There is a big poster on the grey wall, and an exit to the rest of the town."
    menu:
        " Read the poster":
            jump page27
        " Exit":
            jump page25



label page12:
    scene bg
    with None

    "Before doing a frightful jump, I notice the shadow of Beatrix arriving behind me, upset and worried about myself."
    menu:
        " She tells me she regrets her overreaction, and propose we take a drink in a teahouse in the surroundings":
            jump page6



label page13:
    scene bg
    with None

    "The captain, arriving a moment later, feels sorry for his men's rude behavior. Bowing deeply, he requests my opinion on the route to take. Am I dreaming? Is he insane? Or maybe it's just a sick pity."
    "Should we head:"
    menu:
        " North, to our original the destination, the New Continent":
            jump page11
        " South, to reach a little island he's just discovered with his telescope":
            jump page30
        " West, to explore more the vast blue Ocean":
            jump page43
        " East, back to our land of departure":
            jump page24



label page14:
    scene bg
    with None

    "Death can be sweet, when it's so blue!"
    jump end 


label page15:
    scene bg
    with None

    "The sun is high in the sky, yet I feel a chill devoring my neck and my ribs. I remember my childhood in Francimia, my games in the trees and between the rare green hills of the family's domain. Later, still in the trees, reading fantasy books lying on the red and purple carpet in my hut 8 meters above the ground. I remember my mother calling me, with her high pitched voice, to eat the "Gargouaillotte à la Pisaille", a local dish."
    "I suddenly feel I'm turning around."
    menu:
        " Explore more":
            jump page21
        " Go back to the boat":
            jump page11



label page16:
    scene bg
    with None

    "I couldn't imagine being sold as a slave would be like this. It was certainly not the marketplace we could think of, I was just conducted to a dark, moisty, cellar, where I bored to death."
    menu:
        " A few days later, I was sold to a rich family":
            jump page45



label page17:
    scene bg
    with None

    "I dive into the dark water. Soon I feel so alone that I stop breathing."
    menu:
        " Drown deeper":
            jump page14



label page18:
    scene bg
    with None

    "The walls are now cleaner without this sick poster."
    menu:
        " I can continue my walk ":
            jump page25




label page19:
    scene bg
    with None

    "I've felt depressed so many years that I can't stand it any longer. Besides, my current residence and occupation is endangering my sanity and health more and more..."
    image tbd_ship = "tbd_ship.jpg"
    $ showmypic("tbd_ship") 

    "The blue ocean, spreading endlessly toward the north, south, east and west, is reflecting the sun like a glittering chainmail."
    "“Hey Francimi bastard! Come here!”, they shout."
    "Surrounded by those Scottani and Iricimi strangers, I don't feel at ease in this place. Their green and dark-orange helmets make me nervous. I don't really need to obey, they're just basic sailors like me. But could I bear the insults?"
    menu:
        " Rebel":
            jump page3
        " Wait":
            jump page13
        " or look around on the ship, fleeing cowardly to the upper deck":
            jump page5



label page20:
    scene bg
    with None

    "They tell me with an irritated tone, that I made a mistake. It's not there any longer."
    menu:
        " They give me another office number, on the fifth floor, leading me to another place":
            jump page53




label page21:
    scene bg
    with None


    "At the age of 19, I went to the town nearby, for learning how to become a librarian. My father was somehow disappointed, because he wanted me to be an artist. I kept nevertheless my accordion with me, to please him."
    "Damned mosquitoes! With all those flying pests, it's difficult to concentrate."

    menu:
        " Explore more":
            jump page15
        " Go back to the boat":
            jump page11



label page22:
    scene bg
    with None

    "This city is bigger than the standard we can expect on the Old Continent. Huge, pompous, airships are crossing the airs, but also a few aeroplanes, more than in Euralinia."
    "The houses there are wealthier, with influences from the far eastern cities of Asinalia, denoting a strong taste for delicate yet powerful ornaments. I don't really like this at all."
    "What can I do now?"
    menu:
        " Meet the local authorities, to announce myself and be registered":
            jump page44
        " Learn more about the customs and traditions":
            jump page33



label page23:
    scene bg
    with None

    "Some trained, numerous sailors are certainly stronger than a poor wanderer who has always lived on the ground, between the local library and the university."
    menu:
        " They throw me off-board":
            jump page17



label page24:
    scene bg
    with None

    "The ship was probably not having enough goods and supply, and it was not a surprise it would need to travel back to our country of origin."
    "Disappointed and tired, the sailors are leaving the boat in a disciplined row. Used to small local travels, they won't see this new Continent everybody is talking about. I'm nonetheless happy to be here, and to get rid of them all."
    menu:
        " Restart the journey":
            jump page1
        " Visit the docks":
            jump page10
        " Travel back home":
            jump page31



label page25:
    scene bg
    with None

    "This city is bigger than the standard we can expect on the Old Continent. Huge airships are crossing the airs, but also a few aeroplanes, more than in Euralinia."
    image tbd_city01 = "tbd_city01.jpg"
    $ showmypic("tbd_city01") 

    "The houses there are wealthier, with influences from the far eastern cities of Asinalia, denoting a strong taste for delicate yet powerful ornaments."
    "Such dedications for inspirating motives makes me cheerful, helping me to forget my spiritual loneliness."    
    "The sun is beginning to annihilate the moisty effects of the mist, casting some orange lights on the walls."
    "What can I do now?"
    menu:
        " Meet the local authorities, to announce myself and be registered":
            jump page44
        " Learn more about the customs and traditions":
            jump page33
        " Steal some goods, nobody knows me here after all":
            jump page40



label page26:
    scene bg
    with None



    "“Dear traveler,"
    "thank you for being in my game. I hope you don't feel too restricted there, and your freedom of thoughts is not challenged. This short story may really begin when you'll arrived back into civilisation. Don't expect to discover much in those deserted islands. And if by chance you meet Jacqueline, say Hello to her.”"



    menu:
        " With some peace of mind and forgetting the luring greenness of the mountain, I row back to the boat":
            jump page11



label page27:
    scene bg
    with None

    "The most notable thing in this place is a poster printed on an indigo background. Some big, pink letters are saying:"


    "“JOIN THE ARMY OF LOVE(TM)!"
    "The Indigo Love Syndicate(tm) needs you. Thank you for your attention.”"


    "There is no clear way to contact them. Probably they became so powerful recently that it's easy to find them. We'll see!"
    menu:
        " Tear the poster apart":
            jump page8
        " Pray in front of this colorful and appeasing poster":
            jump page36
        " Exit immediately":
            jump page25



label page28:
    scene bg
    with None


    "I tell her about my philosophy of life, and the great goals everyone would like to achieve in the universe. I tell her about beauty, about the will, about ascetism and humility."
    "Crying, the woman embrasses me, embarrassingly hanging to my neck, disowning her previous lovers."
    menu:
        " Invite her to a teahouse, for talking more about important matters":
            jump page6
        " Leave her now, in order to increase her effervescency, and don't arrive too late at my home":
            jump page38



label page29:
    scene bg
    with None

    image tbd_city02 = "tbd_city02.jpg"
    $ showmypic("tbd_city02") 

    "As soon as I enter the cyclopean building, I know this is the perfect place for me, a whole lifetime of commitment for serving literature, even with my approximative grammar and my Francimi accent."
    jump end 



label page30:
    scene bg
    with None

    "We head toward a strange island, a lone trail of yellow, backgrounded by green cliffs high above the beach. Once I arrive on the sand, I find a closed bottle on the ground. There is an old parchment inside."
    menu:
        " Examine the bottle and its content":
            jump page26
        " Explore the island":
            jump page15
        " Go back to the boat":
            jump page11



label page31:
    scene bg
    with None

    "Entering a brown cab carried by a Friesian horse, I quickly reach the small town where I live, in the suburb of the capital, and I stop at the cab station in the center."
    menu:
        " Should I really go strait home now":
            jump page38
        " or visit a friend of mine before that. I haven't seen her for a while, and we probably deserve to spend some good time together":
            jump page4



label page32:
    scene bg
    with None

    "Someone sold me, while doing an important mission: I was supposed to meet an Indigo Love Syndicate leader, and capture him, but it was probably a trap, and **I** was captured instead."
    menu:
        " Go to jail":
            jump page48



label page33:
    scene bg
    with None

    "After a few researchs in the libraries and museum, I discover this society was founded one thousand years ago, after its physical separation from the Old Continent. It grew at a normal pace, without any noticeable events. More worrying is the fact that 10 years ago, a new sect, called the Indigo Love Syndicate, spread quickly across the continent, both among the populace and the elite. Discrete at the beginning, the sect is now one of the major political power in place."
    menu:
        " I can join the opposition, to discover if they are better than what they pretend to fight":
            jump page9
        " I can forget about all those conspiracy stuffs, and lead a normal life, searching for a normal job":
            jump page52



label page34:
    scene bg
    with None

    "During a sunny day, when most of the staff is with the family in holiday by the sea-side, I disable the electrical fences and climb the high walls, to reach liberty and self-realisation."
    "I forgot to get some goods with me, so I'm quite at loss in the streets, with my free will and my empty pockets."
    menu:
        " Meet the local authorities, to be registered and begin a fair, remunerated, job":
            jump page47
        " Learn more about the customs and traditions":
            jump page33
        " Steal some foods and first necessity stuffs":
            jump page40




label page35:
    scene bg
    with None

    "I compare her to a gorgeous and hot mare, to the goddess of fertility, war and lust, to the primeval nursemaid and such."
    menu:
        " Strong as she is, I only get a well-deserved slap, and with the chin and cheek as red as an horny devil who ate pimento, and certanly ashamed, I go out in town":
            jump page41



label page36:
    scene bg
    with None

    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    "I pray in collusion with all the followers of the Indigo Love Syndicate."
    "I fell that my soul is somehow tainted now."
    menu:
        " I continue nevertheless into the town":
            jump page22




label page37:
    scene bg
    with None

    "Thinking probably I misunderstood her idle activity, the woman seems upset to be disturbed by my approach. She tells me frankly she's waiting for someone else and don't care about my disgraceful existance."
    menu:
        " Insist more":
            jump page28
        " Insult her ":
            jump page46
        " Come back home":
            jump page31



label page38:
    scene bg
    with None

    "My appartment is in an almost deserted house with three floors. I live in the last floor, so I can see the woods from my bathroom. There is a huge forest in the eastern part of the town, where people can go hunting, hiking and ressourcing themselves from the modern way of life."
    "I feel so tired, that I go to bed immediately."
    menu:
        " Wake up to":
            jump page55




label page39:
    scene bg
    with None

    "After being knocked down by a pirate with putrid teeth, I'm led to their lair, which is hidden in a big city I've never been before. Could it be I'm on the new Continent after all ?"
    "I was separated from the other sailors to avoid rebellion, and met people with langage and culture I couldn't understand at all."
    menu:
        " I hear the pirates are planning to sell me as a slave":
            jump page16



label page40:
    scene bg
    with None

    "Stealing is easy here: it seems nobody is on guard so I can lure many people. In fact I didn't know the citizen weren't aware of misdeeds just because the police was so effective that criminals were caught within 48 hours."
    menu:
        " Go to jail":
            jump page48



label page41:
    scene bg
    with None

    "My sinful mood entangling my mind into so a well-known depression, I'm wandering in town without purpose. I'm crossing an ornamented iron bridge. A lamplighter is bringing light to the streets, without a smile. The dusk is leaving, replaced soon by the full night. The indigo sky is matching the indigo river and I'm longing for such an harmony."
    "Am I lucky today? (throwing a dice, 5 or 6 means luck)"

    menu:
        " If I'm lucky":
            jump page12
        " If I'm not lucky":
            jump page17



label page42:
    scene bg
    with None

    "Beatrix' appartment is cozy and modern: lots of wooden furniture, ornamented with copper. She begins to remove her clothes, then think again and tells me she prefer we have a drink in a tavern."
    menu:
        " Go out again, to find a tavern":
            jump page7



label page43:
    scene bg
    with None

    "The western side of the sea is famous for its tricky tornados and whirlpools."    
    "The destiny of our boat is yet challenged by some humanly disaster, when a pirate ship is attacking us."
    "The ruffians arrive on board, full of hate and violence, and even if we try to rebel, we're not strong enough to contain their assault for very long."
    "Am I lucky today? (throwing a dice, 5 or 6 means luck)"

    menu:
        " If I'm lucky":
            jump page39
        " If I'm not lucky":
            jump page54



label page44:
    scene bg
    with None

    "They welcome me with great attention, and take my name. They note my request, and give me the number of an office on the second floor."
    "Am I lucky today? (throwing a dice, 5 or 6 means luck)"

    menu:
        " If I'm lucky":
            jump page52
        " If I'm not lucky":
            jump page20





label page45:
    scene bg
    with None

    "Mr and Mrs Caesar own a house which is bigger than anything I had already seen: a private aircraft landing place, a tower in the garden, electricity everywhere, for growing plants and vegetables..."
    "They take me to their workshop, where I'm supposed to assembly stuffs and repair all the gadgets they have in the house: mecanical birds, electrical machines, phonographs..."
    "After one year here, they begin to trust me."
    menu:
        " will I try to escape when they are less watchful":
            jump page34
        " or continue to live here as a cheap laborer":
            jump page48





label page46:
    scene bg
    with None

    "Coming from a dark corner, a man dressed in black hits me on the back."
    menu:
        " I can see a blue veil covering my eyes":
            jump page14




label page47:
    scene bg
    with None

    "They welcome me with great attention, and while taking my name, they show me a list of jobs in the surroundings."    "I'm probably lucky, because there was recently a vacant place as a librarian in the main library."
    "After making me sign a few papers, they show me the road on a map."
    menu:
        " Go there right now, in case somebody takes the place before me":
            jump page2
        " Learn more about the customs and traditions":
            jump page33



label page48:
    scene bg
    with None

    "After a few years as a prisoner, I am more reasonnable, and seek redemption when I'm free again. Probably the best for me is to travel back home, and begin a new life there. Will I be librarian, or adventurer there? I still can't decide."
    jump end 



label page49:
    scene bg
    with None

    "During a mission, I don't feel I get the support I usually deserve, and I feel like I'm entering a trap, without any way out."
    menu:
        " Enter the trap":
            jump page51



label page50:
    scene bg
    with None

    "I tell her about my philosophy of life, and the great goals everyone would like to achieve in the universe. I tell her about beauty, about the will, about ascetism and humility."
    menu:
        " The woman have mercy, and with a perplexed smile, she leads me back to another office":
            jump page44



label page51:
    scene bg
    with None

    "An Indigo Love Cultist, jumping from a dark corner, is showing me some attention and dedication by stabbing my back."
    menu:
        " I can see a blue veil covering my eyes":
            jump page14



label page52:
    scene bg
    with None

    "In the office, they show me a list of jobs in the surroundings."    
    "I'm probably lucky, because there was recently a vacant place as a librarian in the main library."
    "After making me sign a few papers, they show me the road on a map."
    menu:
        " Go there right now, in case somebody takes the place before me":
            jump page29
        " Learn more about the customs and traditions":
            jump page33



label page53:
    scene bg
    with None

    "A kind woman explains me with a soft voice the office I'm looking for is now on the first floor."
    menu:
        " Which is leading to an other office":
            jump page44
        " Before that, I can try to seduce her by chance":
            jump page50



label page54:
    scene bg
    with None

    "During the attack, I see the flashing blue of a pirate's sword, approaching my head so dangerously that I eventually die."
    menu:
        " Fall down":
            jump page14



label page55:
    scene bg
    with None

    "Yawning and stretching, I awake with a good mood. I haven't discovered a new Continent, I haven't experienced great adventures, but I met some people who weren't bad at all."
    "Day after day, I meet my friend Beatrix more and more often, and she tries to cope with my grim humor. She always tells me our story is really like an happy END after all!"

    jump end 

label end:
    show expression Text("THE END.", size=50, yalign=0.5, xalign=0.5, drop_shadow=(2, 2)) as text
    with dissolve
    " " 

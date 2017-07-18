Version 2/140803 of Escapades by Eric Forgeot begins here.

"A simple RPG system."

[License: CC-BY-SA https://creativecommons.org/licenses/by-sa/2.0/fr/]

[designed for Inform7 6L, should be compatible with 6G60]

Chapter 1 - Translations

[We support only French and English at the moment]

[translate] 
Use French translates as (- Constant Fr; -). 

To say Strength: 
	say "[if the French option is active]Force [otherwise]Strength[end if]".

To say Vol: 
	say "[if the French option is active]Volonté [otherwise]Will[end if]".

To say Dex: 
	say "[if the French option is active]Dextérité [otherwise]Dexterity[end if]".

To say Int: 
	say "[if the French option is active]Intelligence [otherwise]Intelligence[end if]".


To say attackroll:
	say "[if the French option is active]Jet d[']attaque [otherwise]Attack Roll[end if]".

To say CCtxt:
	say "[if the French option is active]Capacité de Combat[otherwise]Combat Capacity[end if]".

To say CMtxt:
	say "[if the French option is active]Capacité Mentale / de Magie[otherwise]Mental / Magi Capacity[end if]".

To say hit:
	say "[if the French option is active]Touché [otherwise]Hit[end if]".

To say HitPointstxt:
	say "[if the French option is active]point(s) de vie[otherwise]hit point(s)[end if]".

To say MPointstxt:
	say "[if the French option is active]point(s) de Mental[otherwise]mental point(s) [end if]".


To say missed:
	say "[if the French option is active]Manqué [otherwise]Missed[end if]".

To say DamagesName:
	say "[if the French option is active]Dommages [otherwise]Damages [end if]".

To say IsHostile:
	say "[if the French option is active]est hostile[otherwise]is hostile[end if]".


To say ItRemains:
	say "[if the French option is active]Il reste[otherwise]It remains[end if]".

To say vs:
	say "[if the French option is active]contre[otherwise]versus[end if]".


To say You're dead:
	say "[if the French option is active]La vie vous a quitté [otherwise]You're dead[end if]".

To say You fight with:
	say "[if the French option is active]Votre arme : [otherwise]You fight with[end if]".

Chapter 2 - RPG caracteristics



[define Dice rool]

The dice is a kind of thing.
A dice can be silent or not silent. A dice is usually not silent.

The die is a dice.

[This part is from The Reliques of Tolti-Aph by Graham Nelson]
A die roll is a kind of value. 3d100+30 specifies a die roll with parts dice, sides (without leading zeros), adds (without leading zeros, optional, preamble optional).

To decide which number is roll of (dr - a die roll):
	let the total be the adds part of dr;
	if the die is not silent, say "[dr]: ";
	repeat with counter running from 1 to the dice part of dr
	begin;
		let the roll be a random number from 1 to the sides part of dr;
		if the counter is not 1 and the die is not silent, say ",";
		if the die is not silent, say the roll;
		increase the total by the roll;
	end repeat;
	if the adds part of dr is 0 and the dice part of dr is 1, decide on the total;
	if the adds part of dr is not 0 and the die is not silent, say "+", adds part of dr;
	if the die is not silent, say "=", total;
	decide on the total.

Test rolling is an action out of world applying to one die roll. Understand "dice [die roll]" or "roll [die roll]" or "jet de [die roll]" as test rolling. 

Carry out test rolling: say "[if the French option is active]Vous lancez les dés [otherwise]For your own amusement, you roll [end if]"; let the outcome1 be the roll of the die roll understood; say ", [if the French option is active]faisant [otherwise]making [end if][outcome1 in words]." 

[* We added the pointless verb "roll" as a harmless convenience for testing that die rolls work: if the player types "ROLL 3D6+2", the game might reply "For your own amusement, you roll 3d6+2: 2,5,4+2=13, making thirteen."]


[define caracteristics]
 

A person has a die roll called capacites. The capacites of a person is usually 2d6+30.

A person has a number called tempcapacites. The tempcapacites of a person is usually 0.

A person has a die roll called attack. The attack of a person is usually 4d6.

A person can be friendly or hostile. A person is usually friendly.
A person can be dead or not dead. A person is usually not dead.

A person can be initialised or not initialised. A person is usually not initialised.

Definition: a person is dead if his [current] HitPoints are less than 1.

Instead of doing anything to a dead person, say "[if the French option is active]La vie a quitté [the noun][otherwise][The noun] is dead[end if].".


[
STR  Strength = force
DEX Dexterity = dexterite
WIL Will = volonte
INT  Intelligence
]

[initiate The 4 main capacities]
A person has a number called strength. The strength of a person is usually 5.
A person has a number called dexterity. The dexterity of a person is usually 5.
A person has a number called will. The will of a person is usually 5.
A person has a number called intelligence. The intelligence of a person is usually 5.

[derived capacities]
[The combat capacity = average of strength + dex]
A person has a number called CCombat. The CCombat of a person is usually 5.

[the mental (or magi) capacity = average vol + int]
A person has a number called CMentale. The CMentale of a person is usually 5.

[initiate the 2 ]

[point of life = total for + dex + vol + int]
A person has a number called HitPoints. The HitPoints of a person is usually 20.
[point of mental (or magi) = total (vol + int) x 2]
A person has a number called PdM. The PdM of a person is usually 20.

A person has a number called CCombatOpposition. The CCombatOpposition of a person is usually 0.

A person has a number called bonus damage. The bonus damage of a person is usually 0.
A person has a number called bonus CC. The bonus CC of a person is usually 0.

[Create Random caracteristics for a person (instead of default ones]

Creating carac of something is an activity on persons.

Rule for creating carac of a thing (called character):
		[roll the capacites of the character;]
	let the totalcapacites be the roll of the capacites of the character;
	now the tempcapacites of the character is the totalcapacites;
	let the strengthcharacter be a random number from 1 to tempcapacites of the character;
	[say " strengthcharacter [strengthcharacter] ;]
	if strengthcharacter is greater than 12
		begin;
			decrease strengthcharacter by 5;
		[increase the tempcapacites of the character by 5;]
	end if;
	if strengthcharacter is greater than 7
		begin;
			decrease strengthcharacter by 2;
		[increase the tempcapacites of the character by 2;]
	end if;
	if strengthcharacter is less than 3
		begin;
			increase strengthcharacter by 2;
		decrease the tempcapacites of the character by 2;	
	end if;
	now the strength of the character is the strengthcharacter;
	now the tempcapacites of the character is the tempcapacites of the character - strengthcharacter;
	let the dexteritycharacter be a random number from 1 to tempcapacites of the character;
	[say " dexteritycharacter [dexteritycharacter] ;]
		if dexteritycharacter is greater than 12
		begin;
			decrease dexteritycharacter by 5;
		[increase the tempcapacites of the character by 5;]
	end if;
		if dexteritycharacter is greater than 7
		begin;
			decrease dexteritycharacter by 2;
		[increase the tempcapacites of the character by 2;]
	end if;
	if dexteritycharacter is less than 3
		begin;
			increase dexteritycharacter by 2;
		[decrease the tempcapacites of the character by 2;]	
	end if;
	now the dexterity of the character is the dexteritycharacter;
	now the tempcapacites of the character is the tempcapacites of the character - dexteritycharacter;
	let the willcharacter be a random number from 1 to tempcapacites of the character;	
	[say " willcharacter [willcharacter];]
	if willcharacter is greater than 12
		begin;
		decrease willcharacter by 5;
		[increase the tempcapacites of the character by 5;]
	end if;
		if willcharacter is greater than 7
		begin;
		decrease willcharacter by 2;
		[increase the tempcapacites of the character by 2;]
	end if;
	if willcharacter is less than 3
		begin;
		increase willcharacter by 2;
		[decrease the tempcapacites of the character by 2;	]
	end if;
	[]
	now the will of the character is the willcharacter;
	now the tempcapacites of the character is the tempcapacites of the character - willcharacter;	
	[]
	let the intelligencecharacter be the tempcapacites of the character;
	[say " intelligencecharacter [intelligencecharacter];]
		if intelligencecharacter is less than 3
		begin;
		increase intelligencecharacter by 2;
			if strength of the character is greater than dexterity of the character and strength of the character is greater than will of the character
			begin;
			decrease the strength of the character by 2;
			otherwise;
			if dexterity of the character is greater than strength of the character and dexterity of the character is greater than will of the character
				begin;
				decrease the dexterity of the character by 2;
				otherwise;
				decrease the will of the character by 2;
				end if;
			end if;			
	end if;
	[]
		if intelligencecharacter is less than 3
		begin;
		increase intelligencecharacter by 2;
			if strength of the character is greater than dexterity of the character and strength of the character is greater than will of the character
			begin;
			decrease the strength of the character by 2;
			otherwise;
			if dexterity of the character is greater than strength of the character and dexterity of the character is greater than will of the character
				begin;
				decrease the dexterity of the character by 2;
				otherwise;
				decrease the will of the character by 2;
				end if;
			end if;			
	end if;
	[]
	if intelligencecharacter is greater than 9
		begin;
		increase the will of the character by 1;
		decrease intelligencecharacter by 3;
			if strength of the character is greater than dexterity of the character and strength of the character is greater than will of the character
			begin;
			increase the strength of the character by 2;
			otherwise;
			if dexterity of the character is greater than strength of the character and dexterity of the character is greater than will of the character
				begin;
				increase the dexterity of the character by 2;
				otherwise;
				increase the will of the character by 2;
				end if;
			end if;			
	end if;
	[]
	now the intelligence of the character is the intelligencecharacter;
	now the tempcapacites of the character is the tempcapacites of the character - intelligence of the character;
	[]
	now the CCombat of the character is (the strength of the character + the dexterity of the character) / 2;
	let moduloCC be the remainder after dividing (the strength of the character + the dexterity of the character) by 2;
	if moduloCC is not 0, increase the CCombat of the character by 1;
	[]
	now the CMentale of the character is (the will of the character + the intelligence of the character) / 2;
	let moduloCM be the remainder after dividing (the will of the character + the intelligence of the character) by 2;
	if moduloCM is not 0, increase the CMentale of the character by 1;
	[]
	now the HitPoints of the character is strength of the character + dexterity of the character + intelligence of the character + will of the character;
	now the PdM of the character is (the intelligence of the character + will of the character) * 2;
	Now character is initialised;
	[say "[character] is initialised"]
	say "".
	





Understand the command "score" as something new.

Understand "score" as requesting the score.


Carry out requesting the score:
	carry out the listing the stats activity with Player.
	
	
	
Listing the caracteristics is an action applying to one thing.

Understand "list [someone]" or "lister [someone]" or "stats [someone]" as Listing the caracteristics.

Carry out listing the caracteristics:
	carry out the listing the stats activity with noun.
	
	


Listing the stats of something is an activity on persons.

Rule for listing the stats of a thing (called character):
	say "[line break][line break][Strength]: [strength of character]";
	say "[line break][Dex]: [dexterity of character]";
	say "[line break][Vol]: [will of character]";
	say "[line break][Int]: [intelligence of character]";
	say "[line break][line break][CCtxt]: [CCombat of character]";
	say "[line break][CMtxt]: [CMentale of character]";
	say "[line break][HitPointstxt]: [HitPoints of character]";
	say "[line break][MPointstxt]: [PdM of character][line break]".




[ combat]



Instead of attacking someone (called Opponent):
	now the opponent is hostile;
	now the CCombatOpposition of the player is CCombat of the player + CCombat of the player - CCombat of Opponent + bonus CC of the player;
	if French option is active
		begin;
			say "Capacité d'opposition de [player] contre [Opponent] = [CCombatOpposition of the player][line break]";
		otherwise;
			say "Opposition of [player] against [Opponent] = [CCombatOpposition of the player][line break]";
		end if;
	let the tempattack be the roll of the attack of the player;
	say " --- [attackroll]: [tempattack][line break]";
	[]
	if tempattack is less than the CCombatOpposition of the player
		begin;
			say "[line break][hit]!";
			let the damages be (CCombatOpposition of the player - tempattack) / 2 + bonus damage of the player;
			let moduloDamages be the remainder after dividing (CCombatOpposition of the player - tempattack) by 2;
	if moduloDamages is not 0, increase the damages by 1;
			say "[line break][DamagesName]= [damages][line break]";
			now the HitPoints of the Opponent is HitPoints of the Opponent - damages;
			say "[ItRemains] [HitPoints of the opponent] [HitPointstxt] [italic type]([opponent])[roman type].";
		otherwise;
			say "[missed]! [italic type]([the Player] [vs] [opponent])[roman type][paragraph break]";
	end if;
	[remove bonus in case the player fight bare hand next turn]
	now the bonus damage of the player is 0;
	now the bonus CC of the player is 0.


After attacking someone (called Opponent) with something:
	try attacking opponent.
	
[counter attack]

Counterattacking player of something is an activity on persons.

Rule for counterattacking player of a thing (called opponent):
	if opponent is carrying a weapon (called stuff)
		begin;
		say "[The opponent] fights with [stuff] [italic type](bonus CC: [bonus CC of the stuff] / bonus damage: [bonus damage of the stuff])[roman type].";
		now the bonus damage of the opponent is the bonus damage of the stuff;
		now the bonus CC of the opponent is the bonus CC of the stuff;
	end if;
	[]	
	now the CCombatOpposition of the opponent is CCombat of the opponent + CCombat of the opponent -  CCombat of the player + bonus CC of the opponent;
	if French option is active
		begin;
			say "Capacité d'opposition de [opponent] contre [player] = [CCombatOpposition of the opponent][line break]";
		otherwise;
			say "Opposition of [opponent] against [player] = [CCombatOpposition of the opponent][line break]";
		end if;
	let the tempattack be the roll of the attack of the opponent;
	say " --- [attackroll]: [tempattack][line break]";
	[]
	if tempattack is less than the CCombatOpposition of the opponent
		begin;
			say "[line break][hit]!";
			let the damages be (CCombatOpposition of the opponent - tempattack) / 2 + bonus damage of the opponent;
			let moduloDamages be the remainder after dividing (CCombatOpposition of the player - tempattack) by 2;
	if moduloDamages is not 0, increase the damages by 1;
			say "[line break][DamagesName]= [damages][line break]";
			now the HitPoints of the player is HitPoints of the player - damages;
			say "[ItRemains] [HitPoints of the player] [HitPointstxt] [italic type]([the player])[roman type].";
		otherwise;
			say "[missed]! [italic type]([the Opponent] [vs] [player])[roman type][paragraph break]";
	end if;
	[remove bonus in case the attacker fight bare hand next turn]
	now the bonus damage of the opponent is 0;
	now the bonus CC of the opponent is 0.



Chapter 3 - Weapons

A weapon is a kind of thing.

A weapon has a number called the bonus damage. The bonus damage of a weapon is usually 1.
A weapon has a number called the bonus CC. The bonus CC of a weapon is usually 1.

A thing has a number called the bonus damage. The bonus damage of a thing is usually 0.
A thing has a number called the bonus CC. The bonus CC of a thing is usually 0.


Attacking it with is an action applying to one visible thing and one carried thing. Understand "attack [someone] with [something preferably held]" or "attaquer [someone] avec [something preferably held]" as attacking it with.

[Carry out Attacking it with:
	say "[You fight with] [carried weapon].";
	now the bonus damage of the player is the bonus damage of the carried weapon;
	now the bonus CC of the player is the bonus CC of the carried weapon.
]

Setting action variables for attacking something with something: 
	if the second noun is a weapon (called stuff):
		say "You fight with [stuff] [italic type](bonus CC: [bonus CC of the stuff]) / bonus damage: [bonus damage of the stuff][roman type].";
		now the bonus damage of the player is the bonus damage of the stuff;
		now the bonus CC of the player is the bonus CC of the stuff.
        
Check an actor attacking something with something (this is the can't attack with something that isn't a weapon rule): 
	if the second noun is not a weapon: 
		if the actor is the player, say "[The second noun] is a weak weapon."; 
		try attacking noun.
        
        
[not triggered?]
Check an actor attacking something with something (this is the can't attack a non-person rule): 
	if the noun is not a person: 
		if the actor is the player, say "[The noun] has no life to lose."; 
		stop the action.


Chapter 4 - Initialisations

A human being is a kind of person. A man and a woman are kinds of human being.

When play begins:
	repeat with R running through persons:
		now the die is silent;
		if R is in location and R is not initialised, carry out the creating carac activity with R;
		now the die is not silent.

Every turn:
	repeat with R running through persons:
		now the die is silent;
		if the player is dead, end the story saying "[You're dead]!";
		if R is in location and R is not initialised, carry out the creating carac activity with R;
		if R is hostile and R is in location and R is not dead, say "[The R] [IsHostile].";
		if R is hostile and R is in location and R is not dead, carry out the counterattacking player activity with R;
		if R is hostile and R is in location and R has no weapon and R is human being:
			repeat with W running through weapons:
				if W is in location and W is not carried by the player:
					move W to R;
					say "[line break][The R] grabs [the W].";
				[TODO : attack or grab (only one) weapon but not both]
		now the die is not silent.
		
		
Chapter 5 - Debug (Not for release)

Instant Killing is an action applying to one thing.

Understand "Instant Kill [someone]" as instant killing.

Carry out instant killing:
	say "You instant kill [noun]!";
	now the HitPoints of the noun is 0;
	[now the noun is not living;]
	now the noun is dead.



Escapades ends here.


---- DOCUMENTATION ----

Section: How to use

Escapades is a simple RPG system for your Inform games.

You can call it with:

	Include Escapades by Eric Forgeot. 
	
Then you must initialise the player this way:
	
	when play begins:
		now the die is silent;
		carry out the creating carac activity with the player;
		now the die is not silent.

(by default the dices are displaying the results, to avoid this you must tell them to be silent).

Persons and animals are initialised when they are in the same location as the player. They are by default not hostile, but they will react to an attack by becoming hostile and counter-attacking it. You can initialise hostile foe like this:

	The villain is hostile.
	
You can create and use weapons:

	The sword is a weapon. The bonus damage of the sword is 4. The bonus CC of the sword is 3.
	
(CC = combat capacity)

	
Section: Restrictions and TODO

At the moment it's not possible to concentrate like in the ATTACK extension, but it is planned. 
The hostile creatures are not following you from one location to another.
The hostile creatures don't have any AI (except grabbing a weapon you might drop).
No magic at the moment.
The random caracteristics generation should be improved (more coherent).
It should be possible to initialise weapons and foe through tables.







Section: Credits 

Some code is borrowed from The Reliques of Tolti-Aph by Graham Nelson and from the examples (Lanista) in the Inform Manual by Emily Short.

The escapades rules are taken from the RPG of the same name (also by myself):
https://bitbucket.org/farvardin/escapades-jdr (rules only in French at the moment)


Example: * Return to Fihnargaia - A small RPG example.

	*: "Return to Fihnargaia" by Eric Forgeot
	
	Include Escapades by Eric Forgeot. 
	
	
	when play begins:
		now the die is silent;
		carry out the creating carac activity with the player;
		now the die is not silent.
		
	The sword is a weapon. The bonus damage of the sword is 4. The bonus CC of the sword is 3.

	When play begins:
		move sword to player.
		
	The Pass is a room. The description of pass is "After you found the book of Kalpertsil, you return to the kingdom of Fihnargaia, home of the dwarves, should be a piece of hydromel cake. You are in a deserted pass. The road leads north and south.".
	
	The Valley is a room. It is south from Pass. 

	Instead of going south when the location is Pass, say "You shouldn't flee back now. You must return to Fihnargaia!".
	
	The Cliff is a room. It is north from Pass. The description of Cliff is "This cliff is the last open area before entering the Fihnargaia mountain. It can be escaped from the south, by the Dalarak pass, or from the east, by a rope bridge.".
	
	The stone is in cliff.
	
	The goblin is a man in Cliff. It is hostile.
	
	Instead of going east when the location is Cliff:
		if goblin is not dead
			begin;
				say "You can't now, the goblin is blocking the way!";
			otherwise;
				continue the action;
		end if.
		
	The Rope bridge is east from Cliff. The description of rope bridge is "You're almost at the end of your journey.".
	
	The jackal is an animal in Rope Bridge. 
	
	Instead of going east when location is Rope bridge:
		if jackal is not dead
				begin;
					say "You can't now, the jackal is blocking the way!";
				otherwise;
					say "You reach the other end of the rope bridge, and finally enter the realm of Fihnargaia. Your friends await you there, and you complain they could have better secured the entrance to the Kingdom of the Dwarves. [paragraph break]The Queen and the King greet you, and they receive the precious book of Kalpertsil, which will be soon carefully studied by dwarven scholars to learn more about ancient knowledge.";
					end the story saying "You have won!";
			end if.
			
	Test me with "Go north/Attack goblin with sword/Again/Again/Again."
	
	



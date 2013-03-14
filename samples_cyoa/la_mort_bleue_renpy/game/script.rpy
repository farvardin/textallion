# You can place the script of your game in this file.

# Declare images below this line, using the image statement.
# eg. image eileen happy = "eileen_happy.png"

# Declare characters used by this game.
define n = Character('Narrator', color="#c8ffc8")

init:
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











    image la_mort_bleue = "la_mort_bleue.jpg"
    $ showmypic("la_mort_bleue") 




label page0:
    scene bg
    with None

    menu:
        " Commencer le jeu ":
            jump page1









label page1:
    scene bg
    with None

    "Je me sens tomber. Pas très haut par rapport au sol, heureusement pour moi. Et quelques cordages épais amortissent ma chute. J'ai probablement encore raté un échelon, car il faut dire que je suis dans la lune la plupart du temps en ce moment."
    menu:
        " Je me lève ":
            jump page19



label page2:
    scene bg
    with None

    "Dès que je pose le pied sur le seuil de ce grand bâtiment, des officiers de police m'arrêtent, au motif que je me suis évadé de la maison où je devais rester, ayant été acquit légalement par M. et Mme Caesar."
    menu:
        " En dépit de mes protestations, je suis jeté en prison ":
            jump page48




label page3:
    scene bg
    with None

    "Il y a là un groupe de six marins. Ils ne sont qu'en train de s'amuser après tout !"
    menu:
        " mais je peux leur donner une correction méritée ":
            jump page23
        " ou bien m'enfuir lâchement sur le pont supérieur ":
            jump page5




label page4:
    scene bg
    with None

    "Je sonne à la porte. Béatrix m'ouvre, et me voyant, ne semble pas très heureuse de ma présence. Nous étions bons amis auparavant, aussi je ne comprends pas ses réserves."
    "Elle porte une jolie petite robe légère, blanche et grise, et je ressens tant de poésie dans l'atmosphère que je ne peux m'empêcher de lui dire ce que j'ai sur le cœur."
    menu:
        " Être grossier, mais direct ":
            jump page35
        " Être modéré, mais verbeux ":
            jump page28




label page5:
    scene bg
    with None

    "Ce pont est habituellement réservé aux passagers de première classe. J'espère qu'aucun officier du navire ne me remarquera, sinon j'aurai de sérieux problèmes."
    "J'obtins ce travail sur un navire pour payer ma traversée vers le Grand Continent, qui a été redécouvert il y a seulement quelques siècles."    "En attendant, j'ai toujours été curieux au sujet de la vie là-bas, de savoir si les gens étaient comme nous ou si leur culture était si étrangère qu'il n'était pas possible d'y vivre."
    "J'ai également essayer d'apprendre leur si difficile langue, et je me suis forcé à l'utiliser quotidiennement. C'est ainsi que j'ai déménagé vers Iricimia, qui a une langue proche, et même si je suis loin de complètement la maîtriser, j'ai vécu là-bas un moment, puis j'ai décidé d'embarquer sur ce bateau."
    menu:
        " Après quelques jours, nous arrivons à New Londrin Haven, et j'entre triomphalement dans la ville ":
            jump page25
        " Mais avant cela, je peux explorer un moment le port, amoindrissant par contre le prestige de mon arrivée ":
            jump page27




label page6:
    scene bg
    with None

    "Nous entrons dans un salon de thé à l'ambiance snobinarde, dans une zone touristique. Nous nous ennuyons rapidement en un tel lieu, aussi je propose que nous cherchions un endroit plus agréable pour nous divertir."
    menu:
        " Proposer son appartement ":
            jump page42
        " Proposer mon appartement ":
            jump page38
        " Proposer de prendre un verre dans une taverne proche ":
            jump page7



label page7:
    scene bg
    with None

    "Entrant dans la taverne, je retrouve certains de mes anciens camarades du bateau. Étrangement, ils ne sont pas trop hostile à ma présence. Nous prenons une bière, puis une autre, et finalement je termine la nuit à danser sur les tables, pour la plus grande joie des femmes ici qui frappent dans leurs délicieuses mains en rythme."
    "J'en viens à apprécier cette vie simple, et je ne crains plus cette terreur bleue que j'avais l'habitude de ressentir dans le passé."

    " FIN " 






label page8:
    scene bg
    with None


    "Am I lucky today? (throwing a dice, 5 or 6 means luck)"

    menu:
        " Si je suis chanceux ":
            jump page18
        " Si je suis malchanceux ":
            jump page51




label page9:
    scene bg
    with None

    "L'opposition est remplie de personnes charmantes et engagées, néanmoins je ne peux garantir que leurs dirigeants soient aussi propres politiquement. Il y en a même qui racontent que la tête pensante de l'opposition est infiltrée par le Indigo Love Syndicate."
    "Am I lucky today? (throwing a dice, 5 or 6 means luck)"

    menu:
        " Si je suis chanceux ":
            jump page32
        " Si je suis malchanceux ":
            jump page49




label page10:
    scene bg
    with None

    "Les quais ne sont pas un endroit très agréable pour un être aussi délicat que moi. J'ai immédiatement le sentiment que je pourrais devenir une proie facile pour la plupart des vautours qui sévissent ici."
    "Je remarque une belle femme qui attend près d'un ponton. Au même moment, des marins, rencontrés sur le bateau où j'étais employé, m'interpellent tandis qu'ils entrent dans une taverne."
    menu:
        " M'approcher de cette dame ":
            jump page37
        " Suivre mes anciens camarades dans la taverne ":
            jump page7
        " Retourner chez moi ":
            jump page31


==11==

    "Impassible aux émotions humaines, le navire atteint les premières brumes matinales de l'autre continent. Foulant la jetée et la terre ferme pour la première fois après trois semaines de torture spirituelle, je me sens étourdi et complètement perdu."
    "Il y a un grand poster sur un mur, et la sortie vers le reste de la ville."
    menu:
        " Regarder le poster ":
            jump page27
        " Sortir ":
            jump page25



label page12:
    scene bg
    with None

    "Avant de commettre l'irréparable, je remarque l'ombre de Béatrix arrivant derrière moi, bouleversée et angoissée à mon sujet."
    menu:
        " Elle me dit qu'elle regrette sa réaction trop vive, et propose que l'on prenne un verre ensemble dans un salon de thé dans les environs ":
            jump page6



label page13:
    scene bg
    with None

    "Le capitaine, arrivant peu après, s'excuse pour la conduire grossière de ses hommes. S'inclinant profondément, il me demande mon opinion sur la route à suivre. Est-ce que je rêve ? il est devenu fou, ou bien c'est une sorte de pitié malsaine à mon encontre..."
    "Devrons-nous aller :"
    menu:
        " Au Nord, toujours vers notre destination initialement prévue, le Nouveau Continent ":
            jump page11
        " Au Sud, pour atteindre une petite île qu'il a juste découverte avec sa longue-vue ":
            jump page30
        " À l'Ouest, pour explorer encore plus ce vaste océan bleu ":
            jump page43
        " À l'Est, pour retourner vers notre pays d'origine ":
            jump page24



label page14:
    scene bg
    with None

    "Que la mort peut être douce, lorsqu'elle est si bleue !"
    " FIN " 


label page15:
    scene bg
    with None

    "Le soleil est haut dans le ciel, et pourtant je ressens une brise fraîche dévorant mon cou et mes côtes. Je me souviens de mon enfance en Francimia, mes jeux dans les arbres et entre les rares collines vertes de notre domaine familial. Plus tard, toujours dans les arbres, en train de lire des livres à thème fantastique, allongé sur le tapis rouge et violet dans ma cabane à huit mètres du sol. Je me rappelle également de ma mère m'appelant, avec sa voix haut perchée, pour venir manger la « Gargouaillotte à la Pisaille », un plat local."
    "J'ai soudain l'impression de tourner en rond..."
    menu:
        " Continuer à explorer ":
            jump page21
        " Retourner au bateau ":
            jump page11



label page16:
    scene bg
    with None

    "Je n'aurais jamais imaginé qu'être vendu comme esclave puisse se passer ainsi. Ce n'était certes pas le marché aux esclaves sur la place publique comme on aurait pu l'imaginer, j'ai juste été conduit dans une cave sombre et humide, où je me suis ennuyé à mourir."
    menu:
        " Quelques jours plus tard, j'ai été vendu à une famille aisée ":
            jump page45



label page17:
    scene bg
    with None

    "Je plonge dans l'eau sombre. Je me sens si seul, que rapidement j'arrête de respirer."
    menu:
        " Je coule plus profondément au":
            jump page14



label page18:
    scene bg
    with None

    "Les murs sont maintenant plus propres sans ce poster malsain."
    menu:
        " Je peux continuer mon chemin au":
            jump page25




label page19:
    scene bg
    with None

    "Je me suis senti déprimé tant d'années que je ne puis le supporter plus longtemps. De plus, mon lieu de résidence et mon emploi actuel menacent graduellement tant ma santé mentale que physique..."
    image tbd_ship = "tbd_ship.jpg"
    $ showmypic("tbd_ship") 

    $ renpy.music.play("tbd_musique01.ogg", loop=False)



    "L'océan, immense et bleu, s'étendant à l'infini dans toutes les directions cardinales, reflète le soleil comme une cotte de maille scintillante."
    "« Hé espèce de saloperie de Francimi ! Viens par ici ! », crient-ils."
    "Entouré de ces étrangers Scottani et Iricimi, je ne me sens pas très bien dans cet environnement. Leur casques verts et orange foncés me rendent nerveux. Je n'ai pas besoin de leur obéir, car ce sont de simples marins comme moi. Mais vais-je tolérer ces insultes ?"
    menu:
        " Me rebeller, rdv au":
            jump page3
        " Attendre, rendez-vous au":
            jump page13
        " Sauter dans la mer":
            jump page17
        " ou explorer un peu le bateau, ce qui est un prétexte pour fuir lâchement vers le":
            jump page5



label page20:
    scene bg
    with None

    "On me dit avec un ton irrité que je fais erreur. Ce n'est plus là depuis un moment."
    menu:
        " On me donne un autre numéro de bureau, au cinquième étage, ce qui me conduit au":
            jump page53




label page21:
    scene bg
    with None

    "À l'âge de dix-neuf ans, je suis allé dans la ville la plus proche, pour apprendre à devenir bibliothécaire. Mon père en fut un peu déçu, lui qui souhaitait que je devienne artiste. J'ai quand même emporté mon accordéon avec moi, pour lui faire plaisir."
    "Satanés moustiques ! Avec toutes ces pestes volantes, il est bien difficile de se concentrer."
    menu:
        " Explorer un peu plus ":
            jump page15
        " Retourner au bateau ":
            jump page11



label page22:
    scene bg
    with None

    "Cette ville est énorme selon les standards du vieux contient. De gigantesques dirigeables traversent pompeusement les airs, mais il y a également quelques avions, plus qu'en Euralinia."
    "Les maisons ici sont plus opulentes, avec des influences marquées des villes d'Asinalia les plus extrêmes-orientales, dénotant un goût certain pour les décorations délicates et compliquées. Je n'aime pas cela du tout."

    "Que puis-je faire maintenant ?"
    menu:
        " Rencontrer les autorités locales, pour m'annoncer et m'enregistrer dans leurs services ":
            jump page44
        " En apprendre plus sur leurs coutumes et traditions ":
            jump page33



label page23:
    scene bg
    with None

    "Des marins entraînés et en nombre sont certainement plus costauds qu'un pauvre vagabond comme moi qui a toujours vécu sur le plancher des vaches, entre la bibliothèque du coin et l'université."
    menu:
        " Ils me jettent par dessus-bord au":
            jump page17


==24==

    "Le navire n'avait probablement pas assez de vivre pour effectuer la traversée, et cela n'était pas une surprise de devoir faire demi-tour pour retourner dans notre pays d'origine."
    "Déçus et fatigués, les marins quittent le bateau en colonnes disciplinées. Habitués aux petites traversées locales, ils ne sont pas près de retourner vers ce nouveau Continent dont tout le monde parle."
    "Je suis malgré tout heureux de revenir ici, et d'être débarrassé d'eux."
    menu:
        " Recommencer le voyage depuis le début ":
            jump page1
        " Visiter les docks ":
            jump page10
        " Retourner chez moi ":
            jump page31



label page25:
    scene bg
    with None

    "Cette ville est énorme selon les standards du vieux contient. De gigantesques dirigeables traversent pompeusement les airs, mais il y a également quelques avions, plus qu'en Euralinia."
    image tbd_city01 = "tbd_city01.jpg"
    $ showmypic("tbd_city01") 

    "Les maisons ici sont plus opulentes, avec des influences marquées des villes d'Asinalia les plus extrêmes-orientales, dénotant un goût certain pour les décorations délicates et ayant du caractère."
    "Une telle sollicitude pour des motifs aussi inspirés m'inspire un tel bonheur que j'en oublie un moment ma solitude spirituelle."
    "Le soleil commence à annihiler l'humidité poisseuse de la brume, en envoyant des rayons oranges sur les murs."
    "Que faire maintenant ?"
    menu:
        " Rencontrer les autorités locales, pour m'annoncer et m'enregistrer dans leurs services ":
            jump page44
        " En apprendre plus sur leurs coutumes et traditions ":
            jump page33
        " Voler un peu de nourriture, personne ne me connaît ici après tout ":
            jump page40



label page26:
    scene bg
    with None



    "« Cher voyageur,"
    "merci de participer à ce jeu. J'espère que vous ne vous sentirez pas trop limité ici, et que votre liberté de pensée n'est pas trop mise à mal. Cette courte histoire risque par contre de réellement commencer quand vous retournerez à la civilisation. N'espérez pas découvrir beaucoup de choses dans ces îles désertées. Au fait, si par hasard vous rencontrez Jacqueline, dites-lui bonjour de notre part ! »"



    menu:
        " L'esprit en paix et oubliant la tromperie verdoyante de la montagne, je manie frénétiquement les rames pour retourner au bateau ":
            jump page11



label page27:
    scene bg
    with None

    "Ce qui était le plus visible et étrange dans cet endroit, c'était un poster imprimé sur un fond bleu-indigo, avec écrit par dessus, en lettres énormes et roses :"


    "« REJOIGNEZ L'ARMÉE DE L'AMOUR(TM)!"
    "L'Indigo Love Syndicate(tm) a besoin de vous. Merci pour votre attention. »"


    "Il n'y a pas de moyen clair pour les contacter. Peut-être qu'ils sont devenus si puissants récemment qu'il est aisé de tomber sur eux. On verra bien !"
    menu:
        " Déchirer ce poster ":
            jump page8
        " S'agenouiller et prier devant ce poster coloré et apaisant ":
            jump page36
        " Repartir immédiatement ":
            jump page25



label page28:
    scene bg
    with None

    "Je lui parle de ma philosophie de la vie, et des buts élevés auxquels chacun devrait se référer pour se réaliser dans ce vaste univers. Je lui parle de la beauté, je lui parle de la volonté, de l'ascétisme et de l'humilité."
    "Les yeux pleins de larmes, la femme m'embrasse, s'accrochant de façon embarrassante à mon cou, et reniant ses anciens amants."
    menu:
        " L'inviter dans un salon de thé, pour s'entretenir plus longuement avec elle sur des sujets essentiels ":
            jump page6
        " Lui donner congé maintenant, pour entretenir son excitation en vue d'un rendez-vous ultérieur, et ne pas arriver trop tard chez moi ":
            jump page38



label page29:
    scene bg
    with None

    image tbd_city02 = "tbd_city02.jpg"
    $ showmypic("tbd_city02") 

    "Dès que j'entre dans la bâtisse cyclopéenne, je sais que cet endroit est parfait selon tous mes critères, une vie entière à passer au service de la littérature, même avec ma grammaire approximative et mon accent francimi."

    " FIN " 



label page30:
    scene bg
    with None

    "Nous naviguons vers une île étrange, une longue piste de jaune-ocre, avec en toile de fond des falaises vertes surplombant la plage. Une fois arrivé sur le sable, je trouve sur le sol une bouteille fermée. Il y a un vieux parchemin dedans."
    menu:
        " Examiner la bouteille et son contenu ":
            jump page26
        " Explorer l'île ":
            jump page15
        " Retourner au bateau ":
            jump page11



label page31:
    scene bg
    with None

    "Après être entré dans une calèche tirée par des Frisons, j'atteins rapidement la petite ville où je réside habituellement, dans la banlieue de cette métropole, et je fais arrêter le véhicule au centre-ville."

    menu:
        " Vais-je réellement rentrer directement chez moi maintenant ":
            jump page38
        " ou rendre visite à une amie à moi auparavant ? Je ne l'ai pas vue depuis un moment, et nous avons sans doute le droit de passer un peu de bon moment ensemble ":
            jump page4



label page32:
    scene bg
    with None

    "Quelqu'un m'a vendu, tandis que j'effectuais une importante mission : je devais rencontrer un dirigeant de l'Indigo Love Syndicate, pour le capturer, mais c'était sans doute un piège, et c'est **moi** qui ai été capturé à la place."
    menu:
        " Aller en prison ":
            jump page48



label page33:
    scene bg
    with None

    "Après quelques recherches dans les bibliothèques et musées, je découvre que cette société a été fondée il y a un millier d'années, après sa séparation physique du vieux continent. Elle a grandi à une allure normale, sans événement marquant. Plus inquiétant est le fait que depuis une dizaine d'années, une nouvelle secte, appelée le Indigo Love Syndicate, se répand rapidement à travers le pays, tant parmi le peuple que les élites."    "Discrète à ses débuts, la secte est maintenant un pouvoir politique sur lequel il faut compter."
    menu:
        " Je peux rejoindre l'opposition, pour voir s'ils sont meilleurs que ceux qu'ils prétendent combattre ":
            jump page9
        " Je peux oublier toutes ces théories conspirationnistes, et mener une vie normale, en recherchant un petit travail paisible ":
            jump page52



label page34:
    scene bg
    with None

    "Lors d'une journée ensoleillée où la plupart des domestiques sont dehors avec la famille lors d'une promenade au bord de mer, j'arrive à désactiver la clôture électrique et à escalader les hauts murs entourant la propriété, pour rejoindre la liberté et l'auto-réalisation."
    "Partant précipitamment, j'ai oublié de prendre de la nourriture et quelques affaires avec moi, aussi je me sens rapidement bien perdu dans ces rues étrangères, avec mon libre-arbitre et mes poches vides."
    menu:
        " Aller rencontrer les autorités locale the local authorities, pour m'enregistrer dans leurs services et pouvoir commencer un travail honnête et rémunéré ":
            jump page47
        " En apprendre plus sur leurs coutumes et traditions ":
            jump page33
        " Voler un peu de nourriture et des choses de première nécessité ":
            jump page40




label page35:
    scene bg
    with None

    "Je la compare à une pouliche sublime et splendide, à la déesse de la fertilité, de la guerre et du désir, à l'infirmière primordiale et ainsi de suite."
    menu:
        " Forte comme elle l'est, tout ce que je reçois c'est une gifle bien méritée, et avec la mâchoire et la joue aussi rouges qu'un diable excité ayant mangé du piment, honteux, je repars vers la ville":
            jump page41



label page36:
    scene bg
    with None

    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    "Je prie avec la complicité de tous les adeptes de l'Indigo Love Syndicate."
    "J'ai à ce moment le sentiment que mon âme vient d'être souillée."
    menu:
        " Je continue néanmoins à déambuler dans les rues ":
            jump page22




label page37:
    scene bg
    with None

    "Pensant probablement que j'ai mal interprété son activité d'attente, la femme semble énervée d'avoir été dérangée par mon arrivée. Elle me dit carrément qu'elle attend quelqu'un d'autre et se moque de ma vie disgracieuse."
    menu:
        " Insister un peu plus ":
            jump page28
        " L'insulter ":
            jump page46
        " Retourner chez moi ":
            jump page31



label page38:
    scene bg
    with None

    "Mon appartement se situe dans une maison presque déserte, elle-même sur trois niveaux. J'habite au dernier étage, et ainsi je peux admirer les bois environnants depuis ma salle de bain. Il y a une grande forêt dans la partie orientale de la ville, où les gens peuvent aller chasser, randonner et se ressourcer loin de la vie moderne et stressante."
    "Je me sens si fatigué, que je vais au lit immédiatement."
    menu:
        " Me lever au":
            jump page55




label page39:
    scene bg
    with None

    "Après avoir été assommé par un pirate aux dents pourries, je suis conduit dans leur repaire, qui est caché au milieu d'une grande ville que je n'ai jamais vue auparavant. Se pourrait-il que je sois arrivé sur le nouveau Continent en fin de compte ?"
    "Tous les marins ont été séparés pour éviter la rébellion, et je rencontre dans mon cachot des gens avec des langues et des cultures que je ne comprends pas du tout."
    menu:
        " J'entends un jour que les pirates ont prévu de nous vendre en tant qu'esclaves ":
            jump page16



label page40:
    scene bg
    with None

    "Voler est facile ici : on dirait que personnes n'est sur ses gardes et ainsi je peux arnaquer pas mal de monde. En fait, ce que je ne savais pas, c'était que les citoyens ne se méfiaient jamais des actes délictueux, car ici la police est tellement efficace que les criminels sont attrapés sous quarante-huit heures."
    menu:
        " Aller en prison ":
            jump page48



label page41:
    scene bg
    with None

    "Accablée par la faute, cette humeur funeste embrouille mon esprit dans une dépression bien connue. Errant dans la ville sans but, je traverse un pont décoré de fer forgé. Un lampiste s'affaire à illuminer les rues, sans sourire aucun. Le crépuscule s'estompe, remplacé bientôt par la nuit noire. Le ciel indigo se mêle à la rivière indigo, et j'aspire à une telle harmonie qui me fait cruellement défaut."

    "Am I lucky today? (throwing a dice, 5 or 6 means luck)"

    menu:
        " Si je suis chanceux ":
            jump page12
        " Si je suis malchanceux ":
            jump page17





label page42:
    scene bg
    with None

    "L'appartement de Béatrix est confortable et moderne : il y a là beaucoup de meubles en bois orné de motifs en cuivre, et des tapisseries en laine décorées de fibres optiques."
    "Elle commence à retirer ses habits, mais se ravise et me dit qu'elle préfère finalement prendre un verre à la taverne."
    menu:
        " Sortir de nouveau, pour trouver un bar ":
            jump page7



label page43:
    scene bg
    with None

    "La partie occidentale de cette mer est réputée pour ses tornades fourbes et ses tourbillons imprévus."    "Le destin de notre embarcation est pourtant mis à mal par des désastres bien plus humains, lorsqu'un bateau pirate nous prend d'assaut."
    "Ces rustres passent à l'abordage, emplis de haine et de violence, et même si nous essayons de nous rebeller, nous ne sommes pas assez fort pour contenir leurs attaques pour très longtemps."
    "Am I lucky today? (throwing a dice, 5 or 6 means luck)"

    menu:
        " Si je suis chanceux ":
            jump page39
        " Si je suis malchanceux ":
            jump page54





label page44:
    scene bg
    with None

    "Ils m'accueillent avec une certaine sympathie, et prennent mon nom. Ils notent ma demande, et me donne le numéro d'un bureau au premier étage."

    "Am I lucky today? (throwing a dice, 5 or 6 means luck)"

    menu:
        " Si je suis chanceux ":
            jump page52
        " Si je suis malchanceux ":
            jump page20






label page45:
    scene bg
    with None

    "Monsieur et Madame Caesar possèdent une maison qui est plus grosse que tout ce que j'ai pu voir auparavant : un terrain d'atterrissage pour aéronef, une tour dans le jardin, et de l'électricité partout pour aider à la pousse des plantes et des légumes..."
    "Ils m'ont conduit à leur atelier, où je suis censé assembler des choses et réparer tous les gadgets qu'ils ont dans leur maison : des oiseaux mécaniques, des machines électriques, des phonographes..."
    "Après un an passé ici, ils commencent à me faire confiance."
    menu:
        " Vais-je essayer de m'échapper à un moment où ils me surveillent le moins ":
            jump page34
        " ou continuer à vivre ici en tant que travailleur bon marché ":
            jump page48




label page46:
    scene bg
    with None

    "Sortant d'un coin sombre, un homme vêtu de noir me frappe dans le dos."
    menu:
        " Je vois un voile bleu qui recouvre ma vision ":
            jump page14




label page47:
    scene bg
    with None

    "Ils m'accueillent avec beaucoup d'attention, et tandis qu'ils enregistrent mon nom, on me montre une liste des emplois possibles dans le coin."
    "J'ai sans doute de la chance, parce qu'il vient de se libérer une place de bibliothécaire dans la bibliothèque principale de la ville."
    "Après m'avoir fait signer quelques papiers, ils me montrent la route sur une carte."
    menu:
        " Aller directement là-bas, au cas où quelqu'un d'autre prendrait cette place avant moi ":
            jump page2
        " En apprendre un peu plus sur les coutumes et traditions de la région ":
            jump page33



label page48:
    scene bg
    with None

    "Après quelques années en tant que prisonnier, je m'assagis et deviens plus raisonnable une fois libéré."
    "Sans doute que le mieux pour moi maintenant est de retourner chez moi, et recommencer ma vie là-bas."
    "Serai-je bibliothécaire, ou aventurier ? Je ne peux encore me décider."
    " FIN " 



label page49:
    scene bg
    with None

    "Durant une mission difficile, je sens que je n'obtiens pas l'aide que je mérite habituellement, et j'ai la nette impression de tomber dans un piège, sans moyen d'en réchapper."
    menu:
        " Tomber dans le piège ":
            jump page51



label page50:
    scene bg
    with None

    "Je lui raconte ma philosophie de vie, et lui parle des buts que chacun devrait souhaiter atteindre dans l'univers. Je lui parle de la beauté, de volonté, d'ascétisme et d'humilité."
    menu:
        " La jeune femme, avec pitié et un sourire perplexe, me reconduit au":
            jump page44



label page51:
    scene bg
    with None

    "Un adepte Indigo Love, surgissant d'un recoin sombre, me montre son amour et son attention en me poignardant dans le dos."
    menu:
        " Un voile bleu recouvre alors ma vision ":
            jump page14



label page52:
    scene bg
    with None

    "Dans ce bureau on me présente une liste des emplois possibles dans la région."
    "J'ai sans doute de la chance, parce qu'il vient de se libérer une place de bibliothécaire dans la bibliothèque principale de la ville."
    "Après m'avoir fait signer quelques papiers, ils m'indiquent la route sur une carte."
    menu:
        " Aller immédiatement là-bas, au cas où quelqu'un d'autre prendrait la place avant moi ":
            jump page29
        " En apprendre plus sur leurs coutumes et traditions ":
            jump page33



label page53:
    scene bg
    with None

    "Une jeune femme polie et agréable m'explique avec une voix douce que le bureau que je recherche se trouve maintenant au rez-de-chaussée."
    menu:
        " Ce qui me conduit au":
            jump page44
        " Mais avant cela, je peux tenter de la séduire, on ne sait jamais ":
            jump page50



label page54:
    scene bg
    with None

    "Pendant l'attaque, je vois le flash bleu acier de l'épée d'un pirate, approchant si dangereusement de ma tête que je finis par en mourir."
    menu:
        " Aller au":
            jump page14



label page55:
    scene bg
    with None

    "Baillant et m'étirant, je me réveille de bonne humeur. Je n'ai pas découvert de nouveau Continent, je n'ai pas vécu de grandes aventures, mais j'ai rencontré des gens qui n'étaient pas si mal en fin de compte."
    "Jour après jour, j'ai retrouvé mon amie Béatrix de plus en plus souvent, et elle fait de son mieux pour supporter mon humour grinçant. Elle me dit tout le temps que notre histoire est vraiment comme une FIN heureuse finalement !"

    " FIN " 

label end:
    show expression Text("THE END.", size=50, yalign=0.5, xalign=0.5, drop_shadow=(2, 2)) as text
    with dissolve
    " " 

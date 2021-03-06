require 'json'
require 'open-uri'

puts "Destroy all"

Challenge.destroy_all
Tip.destroy_all
Answer.destroy_all
Option.destroy_all
Question.destroy_all
PartyQuiz.destroy_all
Quiz.destroy_all
Category.destroy_all
User.destroy_all

puts "Creating users..."
 a = User.create!(
    email:        'ali@gmail.com',
    username:     'Ali972',
    level:        5,
    total_point:  67,
    password:     'azerty',
    photo:        "https://res.cloudinary.com/deejctznc/image/upload/v1574778762/Avatar_Femme_qqmh2q.png")
 b = User.create!(
    email:        'flo@gmail.com',
    username:     'Flopaille',
    level:        2,
    total_point:  34,
    password:     'azerty',
    photo:        "https://res.cloudinary.com/deejctznc/image/upload/v1574778762/Avatar_Homme_amvbma.png")
 c = User.create!(
    email:        'lam@gmail.com',
    username:     'Lampoulpe',
    level:        4,
    total_point:  27,
    password:     'azerty',
    photo:        "https://res.cloudinary.com/deejctznc/image/upload/v1574778762/Avatar_Homme_amvbma.png")
 d = User.create!(
    email:        'xd@gmail.com',
    username:     'Xdel',
    level:        2,
    total_point:  23,
    password:     'azerty',
    photo:        "https://res.cloudinary.com/deejctznc/image/upload/v1574778762/Avatar_Homme_amvbma.png")


puts 'Finished!'

puts "Creating Categories..."

transport = Category.create!(name: "Transport", photo: "transport.jpg")
food = Category.create!(name: "Food", photo: "food.jpg")
diy = Category.create!(name: "DIY", photo: "diy.jpg")
energy = Category.create!(name: "Energie", photo: "energy.jpg")
no_waste = Category.create!(name: "Zéro déchet", photo: "no_waste.jpg")
nature_connect = Category.create!(name: "Nature connect", photo: "dame_nature.jpg")

puts 'Finished!'

puts "Creating tips..."


tips = [
  {
    title:         "L’importance de mettre des plantes vertes dans la maison",
    description:   "Les plantes apportent une beauté naturelle à notre foyer. Ces organismes vivants interagissent avec votre corps, votre esprit et votre maison de façon à améliorer votre qualité de vie : Elles aident à mieux respirer, elles purifient l'air et stimulent la guérison.",
    user:          a,
    category:      nature_connect
  },
  {
    title:         "L’importance de trier les déchets à la maison",
    description:   "Les ordures ménagères contiennent de nombreuses matières premières précieuses qui peuvent être recyclées. Plus nous trions et recyclons de déchets, moins nous en jetons dans les conteneurs et moins nous devons payer pour leur transport. Pour trier de manière efficace les déchets ménagers, il est souvent utile de les séparer en plusieurs catégories, notamment : Les déchets organiques (fruits, légumes, coquilles d'oeufs, marc de café...), le verre, le plastique et le métal, le papier et le carton, les déchets non recyclables (les restes cuits, les restes de viandes/poissons, les os...), les déchets dangereux (produits de nettoyage, pile, ampoule...), et les déchets encombrants.",
    user:          b,
    category:      no_waste
  },
  {
    title:         "Les avantages de faire du compost pour son jardin",
    description:   "Le compost est l’un des meilleurs paillis et amendements que l’on puisse apporter au sol de son jardin. C’est une matière organique qui peut être ajoutée au sol pour aider les plantes à pousser. Voici quelques'uns de ses avantages : Introduction d’organisme (micro organisme) précieux dans le sol, ajout de nutriment au sol, amélioration de la structure du sol, moindre utilisation d'eau du au fait qu'un sol fertile retient beaucoup mieux l'humidité, et lutte contre les maladies des plantes.",
    user:          c,
    category:      diy
  },
  {
    title:         "Quelques astuces anti-gaspillage pour une cuisine soucieuse de l’écologie",
    description:   "On dit souvent que la cuisine est la pièce qui consomme le plus en termes d’énergie dans une habitation. De plus cela ne se résume pas seulement à la dépense en énergie car une cuisine peut également être polluante et est le lieu de nombreux gaspillages, que ce soit alimentaires, énergétiques ou aussi en eau, ce qui nuit grandement à l’environnement et à l’écologie. Donc si vous vous souciez de l’avenir de la planète, commencez par votre cuisine et pour cela, il ne suffit que de quelques gestes, à savoir : N’utiliser la cuisine que par nécessité, faire la vaisselle une seule fois par jour, et n'acheter que ce qui est nécessaire (faire des plannings, notamment en ce qui concerne les aliments à acheter et les limiter pour qu’il n’y ait pas de reste).",
    user:          d,
    category:      food
  },
  {
    title:         "Comment gérer efficacement les déchets ménagers",
    description:   "Réduire et gérer correctement la production de déchets ménagers et d’ordures est très important pour la santé et l’hygiène de votre famille et de vos voisins. Nous produisons plus de déchets que ce que nous pourrions gérer ou recycler. A ce titre, il est important que chacun contribue à la gestion et à la réduction de la quantité des déchets produits à la maison. Voici quelques astuces : Acheter des produits avec moins d’emballage, éviter au maximum les matières plastiques et opter pour des emballages réutilisables, donner ce dont vous ne vous servez plus, et controler la quantité de papier que vous utilisez.",
    user:          a,
    category:      no_waste
  },
  {
    title:         "Une meilleure isolation pour une meilleure économie d’énergie",
    description:   "Une maison moins énergivore passe avant tout par une bonne isolation ! Alors, pour optimiser le rendement énergétique que vous pourrez obtenir grâce à la réduction de votre consommation, il est important que vous vérifiiez si votre maison ne laisse pas s’échapper la chaleur par le toit, les murs, le sol ou encore les portes et les fenêtres. Voici quelques matériaux à utiliser en cas de ré isolation de votre intérieur : Les isolants d’origine végétale (la fibre de bois, le chanvre, la chènevotte et le liège), les isolants d’origine minérale (à l’instar de l’argile expansée ou de la perlite et de la vermiculite), les isolants recyclés (la ouate de cellulose et le verre cellulaire).",
    user:          b,
    category:      energy
  },
  {
    title:         "Comment éviter le gaspillage alimentaire ?",
    description:   "Les études ont révélé que près de la moitié de la nourriture des ménages se retrouvent dans les poubelles. En plus de pomper le budget familial, cela nuit également à l’environnement. Alors, si vous êtes à la recherche d’une manière créative pour éviter le gaspillage alimentaire, voici quelques conseils que vous pourrez adopter : Effectuer une liste de course afin d'éviter les achats compulsifs, acheter que ce dont vous allez vous servir, et transformer les rester au lieu de les jeter.",
    user:          c,
    category:      food
  },
  {
    title:         "Plaque à induction et protection de l’environnement, les choses à savoir",
    description:   "La plaque à induction est devenue un équipement incontournable dans les cuisines, et cela, grâce aux multiples avantages qu’elle procure. En effet, si cette invention a la côte actuellement, c’est tout simplement parce qu’elle est moins énergivore que les autres plaques de cuisson traditionnelles : Plus économique et plus fonctionnel, plus écologique et moins énergivore, plus de sécurité et moins d’accident.",
    user:          d,
    category:      energy
  },
  {
    title:         "Permaculture, les avantages d’élever des poules dans son jardin",
    description:   "De plus en plus de gens se mettent à élever des poules pour leur propre consommation au quotidien d’autant plus que ce type d’élevage présente de nombreux avantages. Si vous aussi, vous souhaitez vous mettre à l’élevage de poules dans votre jardin, voici quelques avantages que vous pourrez en bénéficier : Des œufs frais tous les jours, les poules sont des recycleurs hors du commun (tous les restes peuvent être utilisés pour subvenir à leur alimentation), des antiparasitaires efficaces (vous pouvez assurer une zone exempte de parasites autour de votre maison en élevant des poules dans votre jardin).",
    user:          a,
    category:      nature_connect
  },
  {
    title:         "Jardinage écolo, toit végétal un concept à adopter sûrement",
    description:   "Près de deux tiers des Français disent vouloir opter pour un jardin écolo. Parmi les techniques à adopter pour y arriver, le toit végétal et ses avantages : Un toit pour retenir les eaux de pluie, un toit pour améliorer l’isolation thermique (permet de réduire l’usage du climatiseur pendant l’été grâce à l’évapotranspiration, et l’usage du chauffage pendant l’hiver grâce à la réduction de la déperdition de la chaleur au niveau du toit), un toit avec une excellente durée de vie, un toit pour accueillir la biordiversité",
    user:          b,
    category:      energy
  },
  {
    title:         "Des astuces simples pour un jardin écologique",
    description:   "Vous vous demandez certainement comment entretenir votre jardin de manière écologique ? Voici quelques conseils simples que vous pourrez adopter si vous souhaitez préserver l’environnement tout en aidant vos plantes et vos fleurs à bien pousser sans utiliser des produits nocifs à l’éco-système : Opter pour les engrais naturels, choisir des répulsifs naturels (le vinaigre blanc par exemple), récupérer l'eau de pluie pour arrroser les plantes de manière plus écologique.",
    user:          c,
    category:      diy
  },
  {
    title:         "Comment diminuer sa consommation d’eau sous la douche ?",
    description:   "En plus de préserver l’une des ressources naturelles les plus rares au monde, l’économie en eau permet aussi de réduire la facture que vous allez payer tous les mois. Alors, si vous souhaitez adopter une attitude écolo chez vous, voici quelques conseils que vous pourrez adopter afin qu’ils deviennent des habitudes : Préférez les douches par rapport aux bains (le bain représente entre 150 et 200 litres d'eau contre à peine 70 litres pour une douche), équipez vous d'installations intelligentes comme les pommeaux de douches écologiques qui vous permettront de réduire le débit d'eau (jusqu'à 7 litres par minute).",
    user:          d,
    category:      energy
  },
  {
    title:         "Respecter le milieu naturel",
    description:   "Le côté fun de l’environnement c’est la biodiversité, les animaux et les plantes qui vivent çà et là. Oui mais quel est notre pouvoir pour les protéger ? Déjà on évite de bouleverser leur milieu naturel (le paquet de chips jeté à la montagne) ou d’encourager de près ou de loin des industries qui les malmènent (les petits coquillages qu’on ramène de voyage par exemple).",
    user:          a,
    category:      nature_connect
  },
  {
    title:         "N’imprimer qu’en cas de nécessité absolue",
    description:   "Je pense ne rien vous apprendre si je vous dis que les ressources s’épuisent. Pour remédier à ça, un petit geste au quotidien est d’éviter, autant que possible, d’imprimer de l’inutile, en recto pas verso et sur du papier super épais pas recyclé.",
    user:          b,
    category:      no_waste
  },
  {
    title:         "Privilégier les transports en commun à la voiture",
    description:   "Un autre aspect de la pression humaine sur l’environnement passe par les transports. On essaye donc d’abandonner la voiture pour les transports en commun, la marche ou le vélo quand les distances et la météo le permettent, et, même si ce n’est qu’occasionnel.",
    user:          c,
    category:      transport
  },
  {
    title:         "Utiliser une messagerie citoyenne et écologique",
    description:   "À l’origine, Newmanity est un réseau social créé en 2012 autour des questions de développement durable. En septembre 2015, la plateforme a ouvert une messagerie, Newmanity Mail, respectueuse de l’environnement dont l’objectif est de limiter les empreintes numériques et carbone. Grâce à un hébergement « green » (via l’hébergeur Greenshift), les e-mails émettent 2 fois moins de CO2 que la moyenne. Newmanity s’engage, par ailleurs, à respecter la confidentialité des données puisque celles-ci ne sont ni lues ni revendues !",
    user:          d,
    category:      energy
  },
  {
    title:         "S’équiper en fournitures 100% écolo et s’inspirer des espaces les plus green",
    description:   "Un bureau sur la Terre est le spécialiste français de l’équipement de bureau durable et écolo. Les produits sont tous sélectionnés avec soin et certifiés par des labels de développement durable. Et pour ceux qui cherchent des idées pour un aménagement plus écolo de leur bureau, Second Home à Lisbonne est une jungle miniature (plus de 1000 plantes et arbres) dans laquelle les co-workers collaborent. Quant au bâtiment élu le plus vert au monde, il se trouve à Amsterdam et se nomme The Edge. Panneaux solaires, récupération des eaux de pluie, parking vélos, maisons pour oiseaux… tout a été pensé dans cette magnifique réalisation architecturale.",
    user:          a,
    category:      nature_connect
  },
  {
    title:         "Privilégier le train (ou le bus) à l’avion",
    description:   "Le train est le transport écologique par excellence ! Par exemple pour un trajet Paris-Amsterdam qui fait 500km, un train grande ligne n’émet que 12g de CO2/km (contre 242g pour l’avion), joli score (chiffres de l’Ademe). Sinon le bus reste une super option s’il n’y a pas de train ou que ça coûte trop cher (c’est malheureusement régulièrement le cas). Moi ce que j’adore aussi avec le train au-delà du côté écolo, c’est qu’on peut savourer à fond les paysages des pays qu’on découvre. Imaginez-vous être bercés par le roulement du wagon sur les rails, votre visage collé à la vitre tandis que défilent des vallées vertes, des forêts, des lacs…",
    user:          a,
    category:      transport
  },
  {
    title:         "Privilégier le train (ou le bus) à l’avion",
    description:   "Le train est le transport écologique par excellence ! Par exemple pour un trajet Paris-Amsterdam qui fait 500km, un train grande ligne n’émet que 12g de CO2/km (contre 242g pour l’avion), joli score (chiffres de l’Ademe). Sinon le bus reste une super option s’il n’y a pas de train ou que ça coûte trop cher (c’est malheureusement régulièrement le cas). Moi ce que j’adore aussi avec le train au-delà du côté écolo, c’est qu’on peut savourer à fond les paysages des pays qu’on découvre. Imaginez-vous être bercés par le roulement du wagon sur les rails, votre visage collé à la vitre tandis que défilent des vallées vertes, des forêts, des lacs…",
    user:          b,
    category:      nature_connect
  },
]

Tip.create!(tips)

puts "Finished!"

puts "Creating Challenges..."


challenges = [
  {
    title:            "Prendre les transports verts",
    duration:         7,
    step_number:      7,
    points_by_step:   15,
    description:      "Se déplacer autrement, c’est privilégier des modes de transport plus respectueux de l’environnement. Se passer d’une voiture aujourd’hui parait parfois difficile pourtant il existe des solutions alternatives !
                      Utiliser l’énergie humaine :
                      Le vélo et la marche à pied sont les transports verts par excellence ! Écologiques, sains et peu coûteux, ils sont accessibles à la plupart d’entre nous et les bénéfices pour notre santé sont importants.
                      Utiliser les transports en commun (bus, métro, tramway) est un bon moyen de réduire son impact environnemental. En autobus ou en train, un passager émettra 3 à 4 fois moins de GES (Gaz à Effet de Serre) qu’en voiture.
                      Partager un véhicule
                      S’il est parfois difficile de se passer de son véhicule, il est possible de pratiquer l’autopartage ou le covoiturage. Cela permet de réduire les frais pour le conducteur et aussi de développer la convivialité et le partage.",
    category:         transport,
    photo:            "transport.png"
  },
  {
    title:            "Consommer de saison et responsable",
    duration:         14,
    step_number:      14,
    points_by_step:   20,
    description:      "Il est important de privilégier les fruits et légumes de saison pour leur goût, mais aussi afin de réduire notre impact écologique.
                      1. Consommer de saison, c’est profiter de tous les bienfaits nutritionnels.
                      Chaque saison répond à un besoin du corps humain. En hiver, avec le froid et le manque de soleil, notre corps réclame plus de nutriments et de vitamines C. Tant mieux, c’est la saison des légumes riches en minéraux (poireaux, choux, épinards) et des agrumes pleins de vitamine C (mandarines, pamplemousses, clémentines). En été, avec la chaleur, notre organisme dépense moins de calories mais demande plus d’eau : tous les fruits et légumes de la saison en sont gorgés : melons, tomates, courgettes, pastèques, etc. !
                      2. Consommer de saison, c’est encourager les circuits courts.
                      Il est préférable de privilégier les circuits courts afin d’avoir moins d’impact polluant sur la planète. Le premier réflexe à adopter lorsque l’on est dans les grandes surfaces, c’est de regarder la provenance des fruits et légumes mais aussi leur saisonnalité.
                      3. Consommer de saison et local, c’est protéger l’environnement.
                      Les fruits ou légumes hors saison et importés sont souvent transportés soit par avion, soit par bateau (pour les produits congelés ou en conserve) puis par camion dans des conditions permettant leur conservation (réfrigération, climatisation). Ces trois moyens de transport sont polluants pour la planète. De plus, afin que les fruits ne mûrissent pas trop vite pendant le transport, ils sont recouverts de produits chimiques permettant leur conservation",
    category:         food,
    photo:            "food.png"
  },
  {
    title:            "Faire un produit vaisselle ",
    duration:         1,
    step_number:      1,
    points_by_step:   10,
    description:      "Pour fabriquer votre liquide vaisselle, vous avez besoin de :

                        1 grande cuillère à soupe de cristaux de soude,
                        1 petite cuillère de bicarbonate de soude,
                        1 petite cuillère de savon noir dilué dans 2 dL d’eau,
                        1 petit savon de Marseille que vous râperez.
                        Réaliser vos produits ménagers avec des ingrédients naturels et écologique, permet également :
                        de limiter les emballages et donc les déchets,
                        d’éviter les produits chimiques polluants et donc la pollution de l’eau et des sols,
                        de reprendre le contrôle de votre consommation sans se laisser berner par les belles promesses marketing des fabricants.",
    category:         diy,
    photo:            "diy.png"
  },
  {
    title:            "Fabriquer sa lessive ",
    duration:         1,
    step_number:      1,
    points_by_step:   10,
    description:      "Pour fabriquer votre lessive, vous avez besoin de :

                        4l d’eau,
                        150 à 200 g de savon de Marseille en paillettes ou râpé,
                        85 g de bicarbonate de soude,
                        8 à 10 gouttes d’huile essentielle (lavande ou autre parfum).
                        Réaliser vos produits ménagers avec des ingrédients naturels et écologique, permet également :
                        de limiter les emballages et donc les déchets,
                        d’éviter les produits chimiques polluants et donc la pollution de l’eau et des sols,
                        de reprendre le contrôle de votre consommation sans se laisser berner par les belles promesses marketing des fabricants.",
    category:         diy,
    photo:            "diy.png"
  },
  {
    title:            "Économies d’énergie dans la salle de bain",
    duration:         100,
    step_number:      20,
    points_by_step:   10,
    description:      "Prendre des douches plutôt que des bains ? C’est un conseil que l’on entend souvent quand il s’agit d’économiser l’eau. Mais c’est aussi un geste très efficace pour économiser l’énergie. En effet, quand on se chouchoute dans sa baignoire, il faut bien-sûr chauffer l’eau, soit avec une chaudière gaz soit avec un chauffe-eau électrique. Selon l’ADEME, 12%\ des consommations d’énergie d’un ménage servent à chauffer l’eau, ce n’est pas rien ! Logiquement, plus vous économisez d’eau chaude, moins vous consommez d’énergie !",
    category:         energy,
    photo:            "energie-renouvelable.png"
  },
  {
    title:            "Économies d’électricité simplement au quotidien",
    duration:         100,
    step_number:      20,
    points_by_step:   10,
    description:      "Maîtriser le chauffage (et la climatisation) pour économiser l’électricité.
                       Bien gérer l’éclairage : des économies d’électricité à la clef !
                       Pour cela, le premier éco-geste est de miser sur la lumière naturelle ! Eh oui, la lumière du soleil, c’est gratuit, c’est écolo et en plus c’est plus agréable que les lumières artificielles agressives que l’on trouve parfois dans nos intérieurs. Il y en a même qui disent que c’est bon pour le moral.",
    category:         energy,
    photo:            "energie-renouvelable.png"
  },
  {
    title:            "Faites du tri de vos déchets une habitude",
    duration:         7,
    step_number:      7,
    points_by_step:   10,
    description:      "Vous pouvez à présent trier les emballages destinés au recyclage dans vos bacs jaunes:
                      les cartons (petits cartons, boîte de lessive...), et les cartonnettes (boites de gâteau, emballages carton de yaourt...),
                      les briques alimentaire (jus de fruit, briques de lait...),
                      les emballages métalliques (boite de conserve, sprays, mousse à raser, canettes, sirops...),
                      les flaconnages plastiques (bouteilles d'eau, de shampooings, de lait...),
                      les pots : de yaourt, de crème, de miel, de chocolat, de beurre, etc...,
                      les barquettes rigides ou semi-rigides (conditionnement fromages, conditionnements traiteur, etc.),
                      les capsules (de café pour machines, de bouteilles, etc.).
                      Verre : Bacs à verres.
                      Papiers: Bacs bleus.",
    category:         no_waste,
    photo:            "sortwaste.png"
  },
  {
    title:            "Ramasser au moins un dechet par jour",
    duration:         7,
    step_number:      7,
    points_by_step:   10,
    description:      "Les chiffres liés à la production et à la gestion des déchets sont très alarmants : de 80 à 126 tonnes de kilos de déchets sont générés chaque seconde dans le monde. Produits en trop grande quantité, traités par des systèmes défaillants ou inadaptés – lorsqu’ils ne sont pas directement jetés dans la nature, les déchets contaminent nos terres, notre air et nos océans. Au quotidien, tout un chacun constate que les rues, les forêts, les plages, les bas côtés des routes et même les plus hautes montagnes sont tristement jonchés de fragments de plastique, de canettes, de pailles, de prospectus, de mégots et autres emballages.",
    category:         no_waste,
    photo:            "sortwaste.png"
  },
  {
    title:            "Reconnectez vous à l'essentiel",
    duration:         14,
    step_number:      7,
    points_by_step:   15,
    description:      "Déconnecter pour mieux se reconnecter à l'essentiel : Dame nature",
    category:         nature_connect,
    photo:            "damenature.png"
  }
]

Challenge.create!(challenges)
# Desctruction de tous les quiz

# Premier Quiz - Global
quiz1 = Quiz.create(title: 'Mini Quiz', description: 'Petit quiz global', category_id: no_waste.id, points_by_question: 10)
# 1
title = "En quelle année le \"Grenelle\" de l'Environment a-t'il eu lieu en France ?"
details = "Deux lois connues sous le nom de \"Grenelle I\" et \"Grenelle II\" ont été adoptées en 2009 et 2010, à la suite de cette consultation majeure."
link = "https://www.connaissancedesenergies.org/fiche-pedagogique/grenelle-environnement"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz1.id)
Option.create(title: "2007",is_right: true, question_id: question.id)
Option.create(title: "2017",is_right: false, question_id: question.id)
# 2
title = "Dans quelle ville se trouve la plus ancienne centrale nucléaire française encore en activité ?"
details = "La centrale nucléaire de Fessenheim est la première centrale nucléaire en exploitation commerciale (depuis 1978)."
link = "https://fr.wikipedia.org/wiki/Centrale_nucl%C3%A9aire_de_Fessenheim"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz1.id)
Option.create(title: "Fessenheim",is_right: true, question_id: question.id)
Option.create(title: "Gravelines",is_right: false, question_id: question.id)
#3
title = "Quelle est la température idéale dans une chambre ?"
details = "Dans une chambre, la température idéale se situe entre 16 et 17°C. Sous la couette, le chauffage n’est pas une obligation et trop de chaleur peut affecter la qualité du sommeil."
link = "https://www.lenergietoutcompris.fr/actualites-et-informations/economies-energie/realisez-des-economies-d-energie-en-ajustant-la-temperature-de-chacune-des-piece-de-votre-maison-47487"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz1.id)
Option.create(title: "19°C",is_right: true, question_id: question.id)
Option.create(title: "22°C",is_right: false, question_id: question.id)
# 4
title = "Quand je quitte la maison je pense à :"
details = "L'écologie et l'économie vont de pair."
link = "https://particuliers.engie.fr/economies-energie.html"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz1.id)
Option.create(title: "Fermer la porte",is_right: false, question_id: question.id)
Option.create(title: "Eteindre les lumières",is_right: true, question_id: question.id)



# Deuxième Quiz - Energie Renouvelable
quiz2 = Quiz.create(title: 'Energie', description: 'Quiz sur les énergies renouvelables', category_id: energy.id, points_by_question: 5)
# 1
title = "Qu'appelle-t-on énergie renouvelable ?"
details = "Les énergies renouvelables sont des sources d'énergie dont le renouvellement naturel est assez rapide pour qu'elles puissent être considérées comme inépuisables à l'échelle du temps humain.."
link = "https://www.edf.fr/groupe-edf/espaces-dedies/l-energie-de-a-a-z/tout-sur-l-energie/le-developpement-durable/qu-est-ce-qu-une-energie-renouvelable"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz2.id)
Option.create(title: "Sources d'énergie dont le renouvellement naturel est assez rapide",is_right: true, question_id: question.id)
Option.create(title: "Énergie qui fait fonctionner nos moteurs",is_right: false, question_id: question.id)
# 2
title = "Quelle source a le meilleur rendement pour la production d'électricité ?"
details = "Le terme d'énergie hydraulique désigne l'énergie qui peut être obtenue par exploitation de l'eau. Une catégorie d'énergies moins soumise aux conditions météorologiques, mais qui reste réservée à une production d'envergure."
link = "https://www.futura-sciences.com/planete/questions-reponses/energie-renouvelable-sont-cinq-types-energies-renouvelables-4134/"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz2.id)
Option.create(title: "L'eau",is_right: true, question_id: question.id)
Option.create(title: "Le vent",is_right: false, question_id: question.id)
#3
title = "Pourquoi développe-t-on les énergies renouvelables ?"
details = "Dans une chambre, la température idéale se situe entre 16 et 17°C. Sous la couette, le chauffage n’est pas une obligation et trop de chaleur peut affecter la qualité du sommeil."
link = "https://www.lenergietoutcompris.fr/actualites-et-informations/economies-energie/realisez-des-economies-d-energie-en-ajustant-la-temperature-de-chacune-des-piece-de-votre-maison-47487"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz2.id)
Option.create(title: "Elles attenuent les dérèglements climatiques",is_right: true, question_id: question.id)
Option.create(title: "Elles sont peu coûteuses",is_right: false, question_id: question.id)
# 4
title = "L'utilisation des panneaux solaires pour produire l'électricité est-elle dangereuse pour l'environnement ?"
details = "L’impact environnemental du photovoltaïque se situe au niveau de l’énergie grise."
link = "https://www.actu-environnement.com/ae/pdt/panneaux-solaires-impact-environnement-edf-enr-667.php4"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz2.id)
Option.create(title: "Non",is_right: false, question_id: question.id)
Option.create(title: "Oui",is_right: true, question_id: question.id)
# 5
title = "Les cellules photovoltaïques sont composées de :"
details = "Le silicium est un matériau produit par l'industrie métallurgique à partir de sable ou de quartz, riches en silice."
link = "https://www.picbleu.fr/page/les-panneaux-solaires-photovoltaiques-le-silicium#Qu'est-ce%20que%20le%20silicium%20?"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz2.id)
Option.create(title: "Silicium",is_right: true, question_id: question.id)
Option.create(title: "Antimonium",is_right: false, question_id: question.id)
# 6
title = "La géothermie exploite des gisements de :"
details = "La géothermie est une forme d'énergie utilisant la chaleur des profondeurs de la Terre."
link = "https://www.edf.fr/groupe-edf/espaces-dedies/l-energie-de-a-a-z/tout-sur-l-energie/produire-de-l-electricite/qu-est-ce-que-la-geothermie"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz2.id)
Option.create(title: "Vapeur",is_right: false, question_id: question.id)
Option.create(title: "Eau chaude",is_right: true, question_id: question.id)
# 7
title = "La production des éoliennes européennes couvrent les besoins en électricité domestique hors chauffage de :"
details = "Le secteur de l'énergie éolienne en Europe assure 11 % de la production d'électricité de l'Union Européenne."
link = "https://fr.wikipedia.org/wiki/%C3%89nergie_%C3%A9olienne_en_Europe"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz2.id)
Option.create(title: "18 millions de personnes",is_right: false, question_id: question.id)
Option.create(title: "50 millions de personnes",is_right: true, question_id: question.id)
# 8
title = "Lequel de ces deux mots ne désigne pas un vent ?"
details = "Le vent d'autan est un vent soufflant dans le sud/sud-ouest de la France, en provenance du sud-est/sud-sud-est, affectant la partie orientale du bassin aquitain et le sud-ouest du Massif central."
link = "https://fr.wikipedia.org/wiki/Vent_d%27autan"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz2.id)
Option.create(title: "Autan",is_right: false, question_id: question.id)
Option.create(title: "Aquilon",is_right: true, question_id: question.id)
# 9
title = "L'effet photovoltaïque a été découvert par :"
details = "La découverte fut faiyte en 1839 par deux Français, Antoine César Becquerel et son fils Alexandre Edmond Becquerel."
link = "https://www.futura-sciences.com/planete/dossiers/developpement-durable-cellules-photovoltaiques-coeur-panneaux-solaires-1688/page/4/"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz2.id)
Option.create(title: "Louis Lumière",is_right: false, question_id: question.id)
Option.create(title: "Alexandre-Edmond Becquerel",is_right: true, question_id: question.id)



# Troisième Quiz - Transport
quiz3 = Quiz.create(title: 'Transport', description: 'Quiz sur les transports', category_id: transport.id, points_by_question: 7)
# 1
title = "En voiture, quelle est la surconsommation de carburant lors du premier kilomètre parcouru ?"
details = "Sachez également que cette surconsommation est de 25 % lors du deuxième kilomètre."
link = "#"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz3.id)
Option.create(title: "+ 50%",is_right: true, question_id: question.id)
Option.create(title: "+ 20%",is_right: false, question_id: question.id)
# 2
title = "Parmi ces deux polluants, cherchez l’intrus :"
details = "L’acide sulfurique (HCl) est l’intrus car il n’est pas présent et rejeté dans les gaz d’échappement des véhicules. Il provient de l’industrie et de l’incinération des déchets en particulier."
link = "https://www.lefigaro.fr/automobile/2008/10/13/03001-20081013ARTFIG00373-ce-que-recrache-un-pot-d-echappement-.php"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz3.id)
Option.create(title: "L'acide sulfurique (HCl)",is_right: true, question_id: question.id)
Option.create(title: "Le dioxyde de carbone (CO2)",is_right: false, question_id: question.id)
#3
title = "Est-il vraiment utile d’arrêter votre moteur si vous vous arrêtez pendant 2 minutes ?"
details = "Au-delà de 10 secondes, votre véhicule consomme plus de carburant au ralenti que si vous l’arrêtez et le redémarrez."
link = "https://permis-de-conduire.ooreka.fr/astuce/voir/301697/couper-son-moteur-a-l-arret-vraiment-utile"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz3.id)
Option.create(title: "Oui",is_right: true, question_id: question.id)
Option.create(title: "Non",is_right: false, question_id: question.id)
# 4
title = "D’après vous, pour des marchandises, quel est le mode de transport le plus économe en carburant ?"
details = "La péniche est le mode déplacement le plus économique. Avec 5 litres de carburant, elle transporte 1 tonne de marchandises sur 500 km alors que le train le fait sur 330 km et un camion sur seulement 80 km !"
link = "http://www.cnba-transportfluvial.fr/acces-particuliers-cnba/presentation-generale/transport-fluvial"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz3.id)
Option.create(title: "Le train",is_right: false, question_id: question.id)
Option.create(title: "La péniche",is_right: true, question_id: question.id)
# 5
title = "Si vous transportez des objets volumineux pour partir en vacances, il est préférable :"
details = "Il est préférable de transporter les objets volumineux dans une remorque que sur une galerie car la prise au vent de votre véhicule est plus limitée dans ce cas et donc la consommation de carburant et la pollution engendrée sont diminuées."
link = "https://www.lelynx.fr/assurance-auto/vehicule/autre/caravane-remorque/coffre-toit/"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz3.id)
Option.create(title: "De les installer sur la galerie de votre véhicule",is_right: false, question_id: question.id)
Option.create(title: "De les tracter dans une remorque",is_right: true, question_id: question.id)
# 6
title = "Parmi ces deux propositions, laquelle est synonyme d’économie de carburant et donc de moindre pollution ?"
details = "La conduite en surrégime, qui revient bien souvent à pousser les rapports sur un véhicule, sollicite le moteur plus qu’à la normale en augmentant la consommation d’environ 20 %."
link = "https://www.permisecole.com/conduite/conducteur/eco-conduite#/"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz3.id)
Option.create(title: "Une conduite en surrégime",is_right: false, question_id: question.id)
Option.create(title: "Des accélérations modérées",is_right: true, question_id: question.id)
#7
title = "Sur une année, la surconsommation moyenne en carburant des véhicules climatisés est de :"
details = "Sachez que votre véhicule, s’il est climatisé, consomme à l’année environ \"5%\" de plus que le même modèle non climatisé."
link = "https://www.legipermis.com/blog/2015/08/20/climatisation-consommation-essence-astuces-conseils/"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz3.id)
Option.create(title: "5%",is_right: true, question_id: question.id)
Option.create(title: "1%",is_right: false, question_id: question.id)



# Quatrième Quiz - Zéro déchet
quiz4 = Quiz.create(title: 'Déchets', description: 'Quiz sur les déchets', category_id: no_waste.id, points_by_question: 10)
# 1
title = "Quelle part représentent les emballages parmi nos déchets ?"
details = "La part des emballages dans les déchets ménagers est à la hausse (UE:176kg/personne/an) principalement à cause des plats préparés."
link = "http://www.educapoles.org/assets/uploads/teaching_dossiers_files/11_swift_action_sheet_packaging_fr.pdf"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz4.id)
Option.create(title: "La moitié",is_right: true, question_id: question.id)
Option.create(title: "Le quart",is_right: false, question_id: question.id)
# 2
title = "Combien de kilogrammes d'ordures ménagères un Français jette-t-il par jour ?"
details = "Chaque année en France, un habitant produit 354 kg d’ordures ménagères. Les calculs sont réalisés par l’Ademe à partir des tonnages des poubelles des ménages (hors déchets verts) collectées par les collectivités locales."
link = "http://www.cniid.org/Les-dechets-en-France-quelques-chiffres,151"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz4.id)
Option.create(title: "500gr",is_right: false, question_id: question.id)
Option.create(title: "1kg",is_right: true, question_id: question.id)
#3
title = "Combien de bouteilles en plastique faut-il pour faire un pull polaire ?"
details = "27 bouteilles d’eau d’1,5 litre donnent un pull en laine polaire et 12 bouteilles de soda rembourrent un oreiller."
link = "https://www.geo.fr/environnement/du-plastique-pour-faire-des-pulls-26208"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz4.id)
Option.create(title: "27",is_right: true, question_id: question.id)
Option.create(title: "16",is_right: false, question_id: question.id)
# 4
title = "Comment s'appelle l'homme qui, en 1883, a imposé l'usage de récipients spéciaux pour les déchets ?"
details = "Le 24 novembre 1883, Eugène Poubelle, préfet de la Seine, signe le fameux arrêté qui oblige les propriétaires parisiens à fournir à chacun de leurs locataires un récipient muni d'un couvercle."
link = "http://www.planete-echo.net/CollecteParis/EugenePoubelle.html"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz4.id)
Option.create(title: "Arsène Benne",is_right: false, question_id: question.id)
Option.create(title: "Eugène Poubelle",is_right: true, question_id: question.id)
# 5
title = "Combien de kilogramme(s) de vieux papiers faut-il pour faire 1 kg de papier recyclé ?"
details = "Il faut 2 T de pâte à papier pour fabriquer 1 T de papier à base de fibres vierges. Comparativement, 1 tonne de vieux papiers donnera 900 kg de papier recyclé."
link = "https://www.ecoconso.be/fr/Le-papier-recycle"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz4.id)
Option.create(title: "1.3kg",is_right: false, question_id: question.id)
Option.create(title: "Un peu plus d'un kilogramme",is_right: true, question_id: question.id)
# 6
title = "Que signifie ce logo ? ♻"
details = "Symbole universel du recyclage depuis 1970, cette représentation de l’infini conçue par le mathématicien allemand August Ferdinand Möbius signifie, lui, aussi, que votre emballage est recyclable."
link = "https://www.easyrecyclage.com/blog/a-quoi-correspondent-les-logos-de-vos-emballages/"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz4.id)
Option.create(title: "Le fabricant de l'emballage a participé à sa valorisation",is_right: false, question_id: question.id)
Option.create(title: "L'emballage est recyclable",is_right: true, question_id: question.id)
#7
title = "Quel est le taux de recyclage des canettes en France ?"
details = "En France, le taux de recyclage atteint \"67 %\" des canettes utilisées (en acier et en aluminium), en Suisse le taux est de \"91 %\" et \"96 %\" en Allemagne."
link = "https://fr.wikipedia.org/wiki/Canette_(alimentaire)"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz4.id)
Option.create(title: "67%",is_right: true, question_id: question.id)
Option.create(title: "54%",is_right: false, question_id: question.id)
#8
title = "Combien de canettes recyclées faut-il pour fabriquer un vélo ?"
details = "660 canettes d'aluminium recyclées fournissent la quantité d'aluminium pour fabriquer un vélo, 48 000 une voiture et 15 millions un Airbus A380."
link = "https://fr.wikipedia.org/wiki/Canette_(alimentaire)"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz4.id)
Option.create(title: "660",is_right: true, question_id: question.id)
Option.create(title: "1240",is_right: false, question_id: question.id)
#9
title = "Pour une tonne de plastique recyclée, on économise :"
details = ""
link = "http://www.ecoemballages.fr/grand-public/le-petit-geste-aux-grands-effets"
question = Question.create(title: title,details: details,link: link, quiz_id: quiz4.id)
Option.create(title: "800 Kg de pétrole brut",is_right: true, question_id: question.id)
Option.create(title: "562 Kg de pétrole brut",is_right: false, question_id: question.id)


puts "Finished!"


puts "Creating places..."


url = 'https://opendata.bordeaux-metropole.fr/api/records/1.0/search/?dataset=dechetteries-en-temps-reel&rows=23&facet=statut&facet=insee'
dechettery_serialized = open(url).read
dechettery = JSON.parse(dechettery_serialized)
dechettery['records'].each do |elem|
  Place.create(name: "#{ elem['fields']['nom']}", address: "#{ elem['fields']['adresse']}", status: "#{ elem['fields']['statut']}", accept: "#{ elem['fields']['acceptes']}")
end

# name = dechettery['records'][0]['fields']['nom']
# address = dechettery['records'][0]['fields']['adresse']

#  Place.create(name: name, address: address)

puts "Seed DONE"


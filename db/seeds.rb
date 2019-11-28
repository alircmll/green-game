
puts "Destroy all"

Tip.destroy_all
Challenge.destroy_all
Category.destroy_all
User.destroy_all
Quiz.destroy_all

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


puts "Creating tips..."


tips = [
  {
    title:         "Do his own laundry",
    description:   "Make your laundry ecological: with black liquid soap, baking soda and crystals of soda",
    user:          a
  },
  {
    title:         "Eat less meat",
    description:   "Preservation of the planet, defense of animal welfare, mistrust following health scandals ... There are many good reasons to reduce our consumption of meat. But the one we do not talk about enough is the preservation of our health.",
    user:          b
  },
  {
    title:         "To travel ecologically",
    description:   "The train is the ecological transport par excellence! For example, for a 500km Paris-Amsterdam trip, a mainline train emits only 12g of CO2 / km (against 242g for the plane)",
    user:          c
  },
  {
    title:         "Buy local",
    description:   "Consume locally, so first of all make the choice of a consumption that goes in the direction of greater respect for the environment. But it's also giving local producers a chance, those just a few miles from home.",
    user:          d
  }
]

Tip.create!(tips)

puts "Finished!"


puts "Creating Categories..."

transport = Category.create!(name: "Transport")
food = Category.create!(name: "Food")
diy = Category.create!(name: "DIY")
energy = Category.create!(name: "Energy")
no_waste = Category.create!(name: "No waste")
natur_connect = Category.create!(name: "Natur connect")

puts 'Finished!'

puts "Creating Challenges..."


challenges = [
  {
    title:            "Green transport",
    duration:         7,
    step_number:      7,
    points_by_step:   15,
    description:      "Change your trip in 7 days",
    category:         transport
  },
  {
    title:            "Eat local and responsible",
    duration:         14,
    step_number:      10,
    points_by_step:   20,
    description:      "Consumers believe a product is responsible when buying it has a positive effect on the environment or society",
    category:         food
  },
  {
    title:            "Tinkering with recycling",
    duration:         7,
    step_number:      5,
    points_by_step:   10,
    description:      "The DIY : Do It Yourself",
    category:         diy
  },
  {
    title:            "Switch to renewable energies",
    duration:         100,
    step_number:      20,
    points_by_step:   50,
    description:      "Energy is qualified as renewable when it comes from resources that nature is restoring as quickly as they are consumed.",
    category:         energy
  },
  {
    title:            "Sort your garbage",
    duration:         7,
    step_number:      7,
    points_by_step:   10,
    description:      "Sorting your garbage is not rocket science! The majority of them are to be deposited in 3 kinds of bins or containers.",
    category:         no_waste
  },
  {
    title:            "Reconnect to the essentials",
    duration:         14,
    step_number:      9,
    points_by_step:   15,
    description:      "Disconnect to better reconnect to the essentials: Mother Nature",
    category:         natur_connect
  }
]

Challenge.create!(challenges)


# Premier Quiz
quiz = Quiz.create(points_by_question: 2)
# 1
title = "Acheter des vêtements neuf en nylon, en élasthanne ou en polyester : une bonne idée ?"
question = Question.create(title: title, quiz_id: quiz.id)
Option.create(title: "OUI",is_right: false, question_id: question.id)
Option.create(title: "NON",is_right: true, question_id: question.id)
# 2
title = "Le mot \"nature\" vient d'un verbe grec. Quelle signification a le nom \"phýsis\" qui en découle ?"
question = Question.create(title: title, quiz_id: quiz.id)
Option.create(title: "Naissance",is_right: false, question_id: question.id)
Option.create(title: "Croissance",is_right: true, question_id: question.id)
# 3
title = "En 1987, eut lieu à Montréal la signature d'un important protocole. Sur quoi portait-il ?"
question = Question.create(title: title, quiz_id: quiz.id)
Option.create(title: "La protection de la couche d'ozone",is_right: true, question_id: question.id)
Option.create(title: "La réduction des gaz à effet de serre",is_right: false, question_id: question.id)
# 4
title = "Dans quelle ville se trouve la plus ancienne centrale nucléaire française encore en activité ?"
question = Question.create(title: title, quiz_id: quiz.id)
Option.create(title: "Fessenheim",is_right: true, question_id: question.id)
Option.create(title: "Gravelines",is_right: false, question_id: question.id)
# 5
title = "Quel est le premier pays à afficher sa volonté de renoncer au mode de production nucléaire après la catastrophe de Fukushima ?"
question = Question.create(title: title, quiz_id: quiz.id)
Option.create(title: "Russie",is_right: false, question_id: question.id)
Option.create(title: "Allemagne",is_right: true, question_id: question.id)


# Second Quiz
quiz = Quiz.create(points_by_question: 5)
# 1
title = "En quelle année eut lieu, en France, le Grenelle de l'environnement ?"
question = Question.create(title: title, quiz_id: quiz.id)
Option.create(title: "2007",is_right: true, question_id: question.id)
Option.create(title: "2017",is_right: false, question_id: question.id)
# 2
title = "Depuis le 11 mars 2013, qu'est-ce que l'Union Européenne a décidé d'interdire définitivement ? "
question = Question.create(title: title, quiz_id: quiz.id)
Option.create(title: "Les tests des produits cosmétiques sur les animaux",is_right: true, question_id: question.id)
Option.create(title: "Les parfums au musc",is_right: false, question_id: question.id)
# 3
title = "Sur le marché, si des oeufs sont marqués 3FR3112, cela signifie :"
question = Question.create(title: title, quiz_id: quiz.id)
Option.create(title: "Que les poules sont élevées en batterie",is_right: false, question_id: question.id)
Option.create(title: "Que les poules sont élevées en plein air ",is_right: true, question_id: question.id)
# 4
title = "lequel est un label de l'Agriculture Biologique :"
question = Question.create(title: title, quiz_id: quiz.id)
Option.create(title: "Label rouge",is_right: false, question_id: question.id)
Option.create(title: "Nature et Progrès",is_right: true, question_id: question.id)
# 5
title = "Quelle est la température idéale dans une pièce de vie"
question = Question.create(title: title, quiz_id: quiz.id)
Option.create(title: "19",is_right: true, question_id: question.id)
Option.create(title: "22",is_right: false, question_id: question.id)

# Troisième Quiz
quiz = Quiz.create(points_by_question: 10)
# 1
title = "Avoir une alimentation écolo, c'est manger :"
question = Question.create(title: title, quiz_id: quiz.id)
Option.create(title: "Local et Bio",is_right: true, question_id: question.id)
Option.create(title: "Bio de partout",is_right: false, question_id: question.id)
# 2
title = "Quelle ampoule consomme le moins :"
question = Question.create(title: title, quiz_id: quiz.id)
Option.create(title: "La lampe fluorescente compacte",is_right: true, question_id: question.id)
Option.create(title: "La lampe à incandescence",is_right: false, question_id: question.id)
# 3
title = "Quand je quitte une pièce de la maison je pense à :"
question = Question.create(title: title, quiz_id: quiz.id)
Option.create(title: "Ferme la porte",is_right: false, question_id: question.id)
Option.create(title: "Eteindre la lumière",is_right: true, question_id: question.id)
# 4
title = "Quel est le principal gaz responsable du réchauffement de la planète ?"
question = Question.create(title: title, quiz_id: quiz.id)
Option.create(title: "Le dioxyde de carbone",is_right: true, question_id: question.id)
Option.create(title: "L'azote",is_right: false, question_id: question.id)
# 5
title = "Quelle est l'énergie la plus utilisée pour les machines ?"
question = Question.create(title: title, quiz_id: quiz.id)
Option.create(title: "L'énergie hydraulique",is_right: false, question_id: question.id)
Option.create(title: "L'énergie fossile",is_right: true, question_id: question.id)

puts "Finished!"

puts "Seed DONE"


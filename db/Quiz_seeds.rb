# Desctruction de tous les quiz
Quiz.destroy_all
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
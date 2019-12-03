class QuizzesController < ApplicationController
#  quizzes  GET    /quizzes(.:format)                quizzes#index
#  quiz     GET    /quizzes/:id(.:format)            quizzes#show

  def index
    # on filtre sur la catégorie si cette dernière est tarnsmise
    if params["cat"].nil?
      @quizzes = Quiz.all
    else
      @quizzes = Quiz.find_by(category_id: params["cat"])
    end
  end

  def show
    # @quiz = Quiz.find_by(id: params[])
    # Récupération de l'historique des quiz joués
    

  end

end

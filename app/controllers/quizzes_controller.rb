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
    # Récupération de l'historique des quiz joués
    @party_quizzes = PartyQuiz.where(user: current_user)
    
    # récupération du dernier quiz et de son détail
    @last_party_quizzes = @party_quizzes.last
  end
end

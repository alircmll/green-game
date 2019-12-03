class AnswersController < ApplicationController
# -------------------------     ROUTES ---------------------------------
  # party_quiz_answers
        # POST  /party_quizzes/:party_quiz_id/answers(.:format)
        # answers#create

# new_party_quiz_answer
        # GET   /party_quizzes/:party_quiz_id/answers/new(.:format)  
        # answers#new
# ----------------------------------------------------------------------
  def new
    # Récupération de la partie en cours
    @party_quiz = PartyQuiz.find_by(id: params[:party_quiz_id])
    if @party_quiz.nil?
      redirect_to root_path, alert: "quiz not found."
    end

    # Récupération de la question en cours
    @question = @party_quiz.quiz.questions[@party_quiz.position_in_quiz]
    
    # Récupération des valeurs des options possibles

    @options = [[@question.options.first.id, @question.options.first.title], [@question.options.last.id, @question.options.last.title]]
    
    # Récupération de l'option qui est la bonne réponse
    @good_option = (@question.options.first.is_right) ? @question.options.first.id : @question.options.last.id

    # Initialisation de la nouvelle réponse
    @answer = Answer.new
  end

  def create    
    # Récupération de la partie en cours
    @party_quiz = PartyQuiz.find_by(id: params[:party_quiz_id])


    @quiz = Quiz.find_by(id: @party_quiz.quiz_id)
    # version pessimiste on vérifie la cohérence entre party_quiz et quiz
    if !@quiz.nil?
      # Verrou au cas ou qu'il y ai un clic sur les flèche retour du navigateur
      if @party_quiz.position_in_quiz > @quiz.questions.count 
        redirect_to root_path
      end
    else
      redirect_to root_path
    end

    if !@party_quiz.nil?
      # Sauvegarde de la réponse fournit par l'utilisateur
      answer = Answer.new(answer_params)
      #answer.party_quiz = @party_quiz
      answer.user = current_user
      
      if answer.save
        if Option.find(answer.option_id).is_right
          # Si l'option choisie est la bonne réponse alors on incrémente les scores
          @party_quiz.party_points += @quiz.points_by_question
          current_user.total_point += @quiz.points_by_question
          current_user.save
        end

        # On incrémente le numéro de la question et on sauvegarde le tout
        @party_quiz.position_in_quiz += 1
        @party_quiz.save

        if @quiz.questions.count == @party_quiz.position_in_quiz
          # une fois toutes les questions répondues, on update la party_quiz
          @party_quiz.done =true
          @party_quiz.save

          # on va ensuite sur la show de quiz.
          # pour obtenir le résulat de la party_quiz
          redirect_to quiz_path @quiz.id
        else
          # Sinon on passe à la question suivante
          redirect_to new_party_quiz_answer_path
        end
      
      end
    end
  end

private
  def answer_params
    params.require(:answer).permit(:option_id, :party_quiz_id)
  end
end


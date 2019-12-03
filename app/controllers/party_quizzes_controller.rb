class PartyQuizzesController < ApplicationController
# --------------------     ROUTES -----------------------
# new_quiz_party_quiz
       # GET    /quizzes/:quiz_id/party_quizzes/new(.:format)
       # party_quizzes#new
# --------------------------------------------------------
    
def new
    # Vérification qu'une party ne soit pas en cours, sinon on la charge
    @party_quiz = PartyQuiz.find_by(user_id: current_user.id,
        quiz_id: params[:quiz_id].to_i,
        done: false)
        if @party_quiz.nil?
            # Si pas de partie en cours on en créée une nouvelle
            @party_quiz = PartyQuiz.new
            @party_quiz.user = current_user
            @party_quiz.quiz_id = params[:quiz_id].to_i
            @party_quiz.save
        end

        # Redirection vers la boucle Answers#new <-> Answers#create
        redirect_to new_party_quiz_answer_path(party_quiz_id: @party_quiz.id)
    end

private
    def partyQuiz_params
        params.require(:party_quiz).permit(:quiz_id)
    end
end

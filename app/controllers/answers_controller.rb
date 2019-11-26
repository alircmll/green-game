class AnswersController < ApplicationController
  def new

  end

  def create

    answser = Answer.new(answer_params)
    answser.user = current_user
    answser.save
    user_session[:quiz][:currentQuestion] += 1
    # mettre a jour le score du user

    redirect_to quiz_path(id: user_session[:quiz][:id])
  end

private
  def answer_params
    params.require(:answer).permit(:question_id)
  end
end

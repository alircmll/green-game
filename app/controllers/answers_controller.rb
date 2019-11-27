class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @quiz = Quiz.find(user_session["quiz"]["id"])
    @question = @quiz.questions[user_session["quiz"]["currentQuestion"]]    
    @good_option = (@question.options.first.is_right) ? @question.options.first.id : @question.options.last.id
  end

  def create    
    answser = Answer.new(answer_params)
    answser.user = current_user
    answser.save
    user_session["quiz"]["currentQuestion"] += 1
    quiz = Quiz.find(user_session["quiz"]["id"])
    user_session["quiz"]["score"] += quiz.points_by_question
    # mettre a jour le score du user
    redirect_to quiz_path(id: user_session["quiz"]["id"])
  end

private
  def answer_params
    params.require(:answer).permit(:option_id)
  end
end

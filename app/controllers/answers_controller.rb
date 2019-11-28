class AnswersController < ApplicationController
  def new
    # Check quiz in progress
    quiz = user_session["quiz"]
    if quiz == nil 
      @quiz = Quiz.all.sample
      quizSession = {
        "id" => @quiz.id,
        "score" => 0,
        "currentQuestion" => 0
      }
      # Start new quiz
      user_session["quiz"] = quizSession
    else
      @quiz = Quiz.find(quiz["id"])
    end
    
    @answer = Answer.new    
    @question = @quiz.questions[user_session["quiz"]["currentQuestion"]]
    @options = [[@question.options.first.id, @question.options.first.title], [@question.options.last.id, @question.options.last.title]]
    @good_option = (@question.options.first.is_right) ? @question.options.first.id : @question.options.last.id
  end

  def create    
    answser = Answer.new(answer_params)
    answser.user = current_user
    answser.save

    @quiz = Quiz.find(user_session["quiz"]["id"])

    if Option.find(answser.option_id).is_right
      user_session["quiz"]["score"] += @quiz.points_by_question
      current_user.total_point += @quiz.points_by_question
      current_user.save
    end

    user_session["quiz"]["currentQuestion"] += 1

    if @quiz.questions.count == user_session["quiz"]["currentQuestion"]
      redirect_to quiz_path user_session["quiz"]["id"]
    else
      redirect_to new_answer_path
    end
  end

private
  def answer_params
    params.require(:answer).permit(:option_id)
  end
end

class AnswersController < ApplicationController
  def new
    # Check quiz in progress
    quiz = user_session["quiz"]
    if quiz.nil?
      newquiz
    else
      @quiz = Quiz.find_by(id: quiz["id"])
      if @quiz.nil?
        newquiz
      end
    end

    @answer = Answer.new
    @question = @quiz.questions[user_session["quiz"]["currentQuestion"]]
    @options = [[@question.options.first.id, @question.options.first.title], [@question.options.last.id, @question.options.last.title]]
    @good_option = (@question.options.first.is_right) ? @question.options.first.id : @question.options.last.id
  end

  def create
    answer = Answer.new(answer_params)
    answer.user = current_user
    answer.save

    @quiz = Quiz.find_by(id: user_session["quiz"]["id"])

    if Option.find(answer.option_id).is_right
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

  def newquiz
    @quiz = Quiz.all.sample
    quizSession = {
      "id" => @quiz.id,
      "score" => 0,
      "currentQuestion" => 0
    }
    # Start new quiz
    user_session["quiz"] = quizSession
  end
end

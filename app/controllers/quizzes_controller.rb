class QuizzesController < ApplicationController
  def show
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

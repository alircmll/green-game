class QuizzesController < ApplicationController
  def show
    # Check quiz in progress
    quiz = user_session[:quiz]
    if quiz == nil 
      # Pick random one quiz
      @quiz = Quiz.all.sample
      quizSession = {
        id: @quiz.id
        score: 0
        currentQuestion: 1
      }
      # Start new quiz
      user_session[:quiz] = quizSession
    else
      @quiz = Quiz.find(quiz[:id])
    end
  end
end

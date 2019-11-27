class QuizzesController < ApplicationController
  def show
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
        redirect_to new_answer_path
  end
end

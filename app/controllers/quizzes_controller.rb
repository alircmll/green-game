class QuizzesController < ApplicationController
  def show
    user_session["quiz"] = nil
  end
end

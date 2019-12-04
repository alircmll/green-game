class ChallengesController < ApplicationController
  def index
    if params[:cat].present?
      @challenges = Challenge.all
    else
      @challenges = Challenge.find_by(category_id: params[:cat])
    end    
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end

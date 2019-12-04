class ChallengesController < ApplicationController
  def index
    
    if params[:cat].present?
      @challenges = Challenge.where(category_id: params[:cat].to_i)
    else
      @challenges = Challenge.all
    end
    
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end

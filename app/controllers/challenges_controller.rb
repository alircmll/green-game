class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  # def new
  #   @challenge = Challenge.new
  # end

  # def create
  #   @challenge = Challenge.new(challenge_params)
  #   @challenge.category = @category
  #   if @challenge.save
  #     redirect_to challenges_path
  #   else
  #     render :new
  #   end
  # end

  private

  # def challenge_params
  #   params.require(:challenge).permit(:title, :description, :duration, :points_by_step, :step_number, :category_id)
  # end
end



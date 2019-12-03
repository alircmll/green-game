class PartyChallengesController < ApplicationController

  def create

    @challenge = Challenge.find(params[:challenge_id])
    @party_challenge = PartyChallenge.new(party_challenges_params)
    @party_challenge.challenge = @challenge
    @party_challenge.user = current_user
    if @party_challenge.save
      redirect_to user_path(current_user)
    end
  end

  private

  def party_challenges_params
    params.permit(:challenge_id)
  end
end

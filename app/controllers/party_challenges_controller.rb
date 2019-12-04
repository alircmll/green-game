class PartyChallengesController < ApplicationController
  def create
    @challenge = Challenge.find(params[:challenge_id])
    # @party_challenge = PartyChallenge.find_by(challenge_id: params[:challenge_id], completed: false)
    # On trie s'il n'y a pas de party challenge en cours, pour eviter les doublons
    @party_challenge = PartyChallenge.where("challenge_id = ? AND completed = ?", params[:challenge_id], false)
    # Si c'est egale a zero
    if @party_challenge.count == 0
      # On cree une autre party challenge
      @party_challenge = PartyChallenge.new(party_challenges_params)
      @party_challenge.challenge = @challenge
      @party_challenge.user = current_user
      if @party_challenge.save
        redirect_to user_path(current_user)
      end
    else
      # Si une partie est en cours, redirection vers la page user#show
      redirect_to user_path(current_user)
    end

    # if @party_challenge.save
    #   redirect_to user_path(current_user)
    # end

    #  BEFORE CHANGE
    # @challenge = Challenge.find(params[:challenge_id])
    # @party_challenge = PartyChallenge.new(party_challenges_params)
    # @party_challenge.challenge = @challenge
    # @party_challenge.user = current_user
    # if @party_challenge.save
    #   redirect_to user_path(current_user)
    # end
  end

  def update
    @user = User.find(current_user.id)
    @party_challenge = PartyChallenge.find(params[:id])

    # On incrémente la position et on sauvegarde
    @user.total_point += @party_challenge.challenge.points_by_step
    @user.save

    @party_challenge.position += 1
    @party_challenge.save

    if @party_challenge.position == @party_challenge.challenge.step_number
      @party_challenge.completed = true
      @party_challenge.save
    end

    redirect_to user_path(current_user)
  end

  private

  def party_challenges_params
    params.permit(:challenge_id, :completed)
    # params.require(:party_challenges).permit(:challenge_id, :completed)
  end
end

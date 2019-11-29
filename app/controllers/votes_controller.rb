class VotesController < ApplicationController
  def create
    @tip = Tip.find(params[:tip_id])
    @vote = Vote.find_by(tip: @tip, user: current_user)
    if @vote.present?
      @vote.destroy
    else
      Vote.create(tip: @tip, user: current_user)
    end
    redirect_to request.referrer
  end
end

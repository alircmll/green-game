class TipsController < ApplicationController
  def index
    @tips = Tip.all
  end

  def new
    @tip = Tip.new
  end

  def create
    @tip = Tip.new(tips_params)
    @tip.user = current_user
  end

  private

  def tips_params
    params.require(:tip).permit(:title, :description)
  end
end

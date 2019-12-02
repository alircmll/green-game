class TipsController < ApplicationController
  def index
    @tips = Tip.where(category_id: params[:id])
  end

  def show
    @tip = Tip.find(params[:id])

  end

  def new
    @tip = Tip.new
  end

  def create
    @tip = Tip.new(tips_params)
    @tip.user = current_user

    if @tip.save
      redirect_to tips_path, notice: 'Your tip as successfully been created.'
    else
      render :new
    end
  end

  def destroy
    @tip = Tip.find(params[:id])
    @tip.destroy
    redirect_to tips_path
  end

  private

  def tips_params
    params.require(:tip).permit(:title, :description, :category_id)
  end
end

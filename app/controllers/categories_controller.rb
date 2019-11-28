class CategoriesController < ApplicationController
  def index
    if params[:search].present?
      @categories = Category.perform_search(params[:search])
      @tips = Tip.perform_search(params[:search])
      @challenges = Challenge.perform_search(params[:search])
      if @tips.nil?
        @tips = []
      end
      if @challenges.nil?
        @challenges = []
      end
    else
      @categories = Category.all
    end
  end

  def show
    @category = Category.find(params[:id])
  end
end

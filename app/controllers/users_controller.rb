class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)

    # J'appelle la function Level Up et je sauvegarde dans la DB
    level_up
    @user.save
  end

  def edit
    @user = User.find(current_user.id)

  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    @user.save
    redirect_to user_path(@current_user.id)
  end
  
  private

  # def test1
  #   @user.total_point = @user.total_point + 17
  #   @user.save
  # end

  def level_up
    next_level = 100
    if @user.total_point >= next_level 
      @user.level = @user.level + 1
      @user.total_point = @user.total_point - next_level  
      @user.save
    end 
  end
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :photo)
  end
end

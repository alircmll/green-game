class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    # ! Voir si une partie n'est pas completed
    @party_challenges = PartyChallenge.where(completed: false, user_id: current_user)
    @count = 0
    @countdone = 0
    @countcat = 0
    @party_challenges.each do |pc|
      if (pc.updated_at.day != Time.now.day) || (pc.created_at.day == Time.now.day and pc.position == 0)
        @count += 1
      end
      if (pc.updated_at.day == Time.now.day and pc.position > 0)
        @countdone += 1
      end
    end

    # * J'appelle la function Level Up et je sauvegarde dans la DB
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

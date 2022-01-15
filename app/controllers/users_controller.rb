class UsersController < ApplicationController
  def follow
    @user = User.find(params[:id])
    current_user.followees << @user
    redirect_to radars_path
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end

  def save
    @user = current_user
    if @user.save
      render json: { success: true }
    else
      render json: { success: false, errors: user.errors.messages }, status: :unprocessable_entity
    end
  end
end

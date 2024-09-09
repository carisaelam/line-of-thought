class FollowsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
    redirect_to @user
  end

  def followers
    @user = User.find(params[:user_id])
    @followers = @user.followers.all
  end

  def followees
    @user = User.find(params[:user_id])
    @followees = @user.followees.all
  end
end

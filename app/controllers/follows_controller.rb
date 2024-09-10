class FollowsController < ApplicationController
  include ActionView::RecordIdentifier

  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(dom_id(@user, :follow_buttons), partial: "users/follow_buttons", locals: { user: @user }),
          turbo_stream.replace(dom_id(@user, :follow_counts), partial: "users/follow_counts", locals: { user: @user })
        ]
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(dom_id(@user, :follow_buttons), partial: "users/follow_buttons", locals: { user: @user }),
          turbo_stream.replace(dom_id(@user, :follow_counts), partial: "users/follow_counts", locals: { user: @user })
        ]
      end
    end
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

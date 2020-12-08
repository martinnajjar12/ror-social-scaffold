class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @friendships = Friendship.all { where friend.id == current_user.id }
  end

  def show
    @user = User.find(params[:id])
    @posts = if current_user.friend?(@user)
               @user.posts.ordered_by_most_recent
             else
               []
             end
    @friendships = Friendship.all { where friend.id == current_user.id }
  end
end

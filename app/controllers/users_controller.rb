class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @friendships = Friendship.all { where friend.id == current_user.id }
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    @friendships = Friendship.all { where friend.id == current_user.id }
  end
end

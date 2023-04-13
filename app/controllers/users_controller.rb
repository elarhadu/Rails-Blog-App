class UsersController < ApplicationController
  def index
    @users = User.includes(:posts).all
    @current_user = current_user
  end

  def show
    @user = User.includes(posts: %i[author comments]).find(params[:id])
  end
end

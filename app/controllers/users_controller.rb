class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?

  def index
    @users = User.includes(:posts).all
  end

  def show
    @user = User.includes(posts: %i[author comments]).find(params[:id])
  end
end

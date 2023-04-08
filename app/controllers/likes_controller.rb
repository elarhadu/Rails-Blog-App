class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.user = current_user
    @like.post = Post.find(params[:post_id])
    if @like.save
      flash[:success] = 'Like successfully added😎!'
      redirect_to "/users/#{current_user.id}/posts"
    else
      flash[:alert] = "Couln't add a like😢!"
      render :new, status: :unprocessable_entity
    end
  end
end

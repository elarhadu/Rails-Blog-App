class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post_id = @post.id
    if @comment.save
      flash[:success] = 'Comment successfully added!😎'
      redirect_to "/users/#{current_user.id}/posts"
    else
      flash[:alert] = 'Comment not added!😢'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

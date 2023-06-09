class PostsController < ApplicationController
  def index
    @user = User.includes(posts: :comments).find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def show
    @post = Post.includes(:author, :comments).find(params[:id])
    @user = @post.author
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = 'Post created successfully😎!'
      redirect_to "/users/#{current_user.id}/posts"
    else
      flash[:alert] = 'Post not created😢!'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @post = Post.new
  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
  end

  def create
    # @post = Post.new post_params
    @post.user = current_user
  end

  def index
    @posts = Post.last(6)
    @ftPost = Post.first(1)
  end

  def update
    @post = Post.find params[:id]
    post_params = params.require(:post).permit([:title, :body, :date, :user_id, :category_id])

    if @post.user != current_user
      flash[:alert] = "You cannot change a post that you did not create"
      redirect_to post_path(@post)
    elsif @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
  end


  private
  def find_post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit([:title, :body, :date, :user_id, :category_id])
  end

end

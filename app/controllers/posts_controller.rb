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

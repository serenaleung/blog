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
    @post = Post.new(post_params)
    # @post = Post.new post_params
    @post.user = current_user

    @post.save
  end

  def index
    @posts = Post.last(6)
    @ftPost = Post.first(1)
  end

  def edit
    # redirect_to root_path, alert: 'Cannot edit post; access denied'
    #   unless can_edit_post?(@post)
    #   end
    # @post = Post.find params[:id]
    redirect_to root_path, alert: 'access denied' unless can? :edit, @post
  end

  def update
    @post = Post.find(params[:id])
    post_params = params.require(:post).permit([:title, :body, :date, :user_id, :category_id])

    if !(can? :edit, @post)
      redirect_to root_path, alert: 'Cannot update post; access denied'
    elsif @post.update(post_params)
      redirect_to post_path(@post),
      notice: 'Post updated'
    else
      render :edit
    end
  end

  def destroy
    if can? :destroy, @post
      @post.destroy
      redirect_to posts_path, notice: 'Post deleted'
    else
      redirect_to root_path, alert: 'Access denied'
    end
  end


  private
  def find_post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit([:title, :body, :date, :user_id, :category_id])
  end

end

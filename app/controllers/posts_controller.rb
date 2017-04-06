class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
  end

  def index
    @posts = Post.last(6)
    @ftPost = Post.first(1)
  end

end

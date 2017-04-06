class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    comment_params = params.require(:comment).permit(:image, :name, :body)
    @comment = Comment.new(comment_params)
    @comment.post = @post

    # @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@post), notice: 'Comment Created!'
    else
      redirect_to post_path(@post), alert: "Couldn't Create Comment!"
		# render '/posts/show'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    post = comment.post
    comment.destroy
    redirect_to post_path(post), notice: 'Comment deleted!'
  end
end

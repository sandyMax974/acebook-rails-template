class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id

    @comment.save

    redirect_to post_path(@comment.post)
  end 

  def comment_params
    params.require(:comment).permit(:user_id, :comment)
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    
    redirect_to post_path(@comment.post)
  end

  # def destroy
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.find(params[:id])
  #   @comment.destroy
  #   redirect_to post_path(@post)
  # end

end
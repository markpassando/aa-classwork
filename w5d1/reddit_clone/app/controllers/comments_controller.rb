class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to post_url(@comment.post)
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end

  def show
    @comment = Comment.find(params[:id])
  end
end

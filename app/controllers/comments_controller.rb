class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params) 
    @comment.save
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :priority, :customer_id)
    .merge(user_id: current_user.id, customer_id: params[:customer_id])
  end
end

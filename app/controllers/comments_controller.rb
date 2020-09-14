class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params) 
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    end
  end

  def destroy
    comment = Comment.find(params[:customer_id])
    if comment.destroy
      redirect_to  controller: :customers, action: :show
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :priority, :customer_id)
    .merge(user_id: current_user.id, customer_id: params[:customer_id])
  end
end

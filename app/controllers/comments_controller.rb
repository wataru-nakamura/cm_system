class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    ActionCable.server.broadcast 'comment_channel', content: @comment if @comment.save
  end

  def destroy
    comment = Comment.find(params[:customer_id])
    redirect_to controller: :customers, action: :show if comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :priority, :customer_id)
          .merge(user_id: current_user.id, customer_id: params[:customer_id])
  end
end

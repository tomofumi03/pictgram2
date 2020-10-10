class CommentsController < ApplicationController
  def index
#binding.pry
    @comments = Comment.where(topic_id: params[:topic_id]).page(params[:page]).per(2)
    @comment = Comment.new
  end


  def create
    #binding.pry
    comment =Comment.new(comment_params)
    #comment.user_id = current_user.id
    #comment.topic_id = params[:comment][:topic_id]
    if comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      redirect_to topics_path, danger: 'コメントに失敗しました'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content,:user_id,:topic_id)

  end
end

class CommentsController < ApplicationController
  #binding.pry
  def index
    @topics = Topic.find_by(id: params[:topic_id])
    @comments = Comment.where @topics
    @comment = Comment.new
  end


  def create
    #binding.pry
    comment =Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.topic_id = params[:comment][:topic_id]
    if comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      redirect_to topics_path, danger: 'コメントに失敗しました'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end

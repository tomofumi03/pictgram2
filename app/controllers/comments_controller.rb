class CommentsController < ApplicationController
  before_action :authenticate_user!


  def create
    #binding.pry
    topic = Topic.find(params[:topic_id])
    @comment = topic.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
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

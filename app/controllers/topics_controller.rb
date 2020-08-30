class TopicsController < ApplicationController

  def index
    #binding.pry
    @topics = Topic.all.includes(:favorite_users)
    #@topics = Topic.all.order(id: "DESC").includes(:favorite_users)
    #@topics = Topic.all.order(favorite_users: :desc).includes(:favorite_users)
    @comment = Comment.new
    @q = Topic.search(params[:q])
    @topic = @q.result(distinct: true)
  end


  def new
    #binding.pry
    @topic = Topic.new
  end

  def create
    #binding.pry
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = '投稿に成功しました'
      render :new
    end
  end

  private
  #binding.pry
  def topic_params
    params.require(:topic).permit(:image,:description,:title)
  end
end

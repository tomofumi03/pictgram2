class TopicsController < ApplicationController

  def index
    #binding.pry
    @topics = Topic.all.includes(:favorite_users)
    if params[:order_param] == "new"
      @topics = Topic.all.order(id: "DESC").includes(:favorite_users)
    elsif params[:order_param] == "old"
      @topics = Topic.all.includes(:favorite_users)
    else params[:order_param] == "favorite"
      @topics = Topic.joins(:favorites).group("favorites.topic_id").order("count_all DESC").count




    end
    #binding.pry
    @comment = Comment.new
    @q = Topic.search(params[:q])
    @topics = @q.result(distinct: true)
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

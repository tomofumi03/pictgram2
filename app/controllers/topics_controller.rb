class TopicsController < ApplicationController
  def index
    #binding.pry
    @comment = Comment.new
    @q = Topic.search(params[:q])
    @topics = @q.result(distinct: true)


    @topics = @topics.all.includes(:favorite_users)
    if params[:order_param] == "new"
      @topics = @topics.all.order(id: "DESC").includes(:favorite_users)
    elsif params[:order_param] == "old"
      @topics = @topics.all.includes(:favorite_users)

    else params[:order_param] == "favorite"
      #binding.pry


      @topics = @topics.select('topics.*', 'count(favorites.id) AS favs').left_joins(:favorites).group('topics.id').order('favs desc')



    end


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

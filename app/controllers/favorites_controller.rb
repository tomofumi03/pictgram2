class FavoritesController < ApplicationController
  def index
    #binding.pry
    @favorite_topics = current_user.favorite_topics
  end

  def create
    #binding.pry
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]

    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りの登録に失敗しました'
    end
  end

  def destroy
    #binding.pry
    @favorite = Favorite.find_by(user_id: current_user.id, topic_id:params[:topic_id])
    @favorite.destroy
    redirect_to topics_path, success:'お気に入りを取り消しました'
  end
end

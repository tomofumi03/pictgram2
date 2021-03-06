class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #binding.pry
    @user =User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def edit
    #binding.pry
    @user = User.find(params[:id])
  end

  def update
    #binding.pry
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to topics_path, success: '変更が完了しました'
    else
      flash.now[:danger] = "変更に失敗しました"
      render :new
    end
  end

  def destroy
    #binding.pry
    User.find(params[:id]).destroy
    #binding.pry
    redirect_to root_path, success: '削除が完了しました'
  end

  private
  #binding.pry
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end

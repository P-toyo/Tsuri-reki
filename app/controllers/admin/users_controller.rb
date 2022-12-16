class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = User.all.page(params[:page]).per(15) #全ての投稿データを取得
  end

  def show
    @user = User.find(params[:id]) #特定のユーザーのデータを取得
    @posts = @user.posts #特定のユーザーの投稿を取得
  end

  def edit
    @user = User.find(params[:id]) #特定のユーザーのデータを取得
  end

  def update
    user = User.find(params[:id]) #特定のユーザーのデータを取得
    user.is_deleted = params[:is_deleted]
    user.save #送られてきたデータを保存
    redirect_to request.referer #元のページに戻る
  end

  private

  def user_params
    params.require(:is_deleted)
  end

end

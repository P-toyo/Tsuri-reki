class Admin::InformationController < ApplicationController

  def index
    @information = Information.all.page(params[:page]).per(15)
    @new_information = Information.new
  end

  def new
    @information = Information.new
  end

  def create
    information = Information.new(information_params) #送られてきたデータを取得
    information.save #データを保存
    redirect_to admin_information_index_path #お知らせ一覧画面に遷移
  end

  private

  def information_params
    params.require(:information).permit(:title, :body, :image)
  end

end

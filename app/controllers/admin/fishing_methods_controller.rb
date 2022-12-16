class Admin::FishingMethodsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @fishing_methods = FishingMethod.all.page(params[:page]).per(15) #全ての釣法データを取得
    @new_fishing_method = FishingMethod.new #新規登録用のデータを取得
  end

  def create
    @fishing_method = FishingMethod.new(fishing_method_params) #送られてきたデータを取得
    @fishing_method.save #データを保存
    redirect_to request.referer
  end

  def destroy
    fishing_method = FishingMethod.find(params[:id]) #削除するデータを取得
    fishing_method.destroy #データを削除
    redirect_to request.referer #釣法一覧画面に遷移
  end

  private

  def fishing_method_params #受信するデータの選択
    params.require(:fishing_method).permit(:name)
  end

end

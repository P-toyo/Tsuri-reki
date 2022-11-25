class Admin::AreasController < ApplicationController

  def index
    @areas = Area.all #全ての釣り場データを取得
    @new_area = Area.new #新規登録用のデータを取得
  end

  def create
    area = Area.new(area_params) #送られてきたデータを取得
    area.save #データを保存
    redirect_to request.referer #釣り場一覧画面に遷移
  end

  def destroy
    area = Area.find(params[:id]) #削除する釣り場のデータを取得
    area.destroy #データを削除
    redirect_to request.referer #釣り場一覧画面に遷移
  end

  def update
    area = Area.find(params[:id]) #編集する釣り場のデータを取得
    area.update(area_params) #データを保存
    redirect_to request.referer #釣り場一覧画面へ遷移
  end


  private

  def area_params #受信するデータの選択
    params.require(:area).permit(:name, :prefecture_id, :longitude, :latitude)
  end

end

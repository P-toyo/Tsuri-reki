class Admin::SpeciesController < ApplicationController

  before_action :authenticate_admin!

  def index
    @species = Species.all.page(params[:page]).per(15) #全ての魚種データを取得
    @new_species = Species.new #新規登録用のデータを取得
  end

  def create
    @species = Species.new(species_params) #送られてきたデータを取得
    @species.save #データを保存
    redirect_to request.referer #魚種一覧画面に遷移
  end

  def destroy
    species = Species.find(params[:id]) #削除する魚種のデータを取得
    species.destroy #データを削除
    redirect_to request.referer #魚種一覧画面に遷移
  end


  private

  def species_params #受信するデータの選択
    params.require(:species).permit(:name)
  end

end

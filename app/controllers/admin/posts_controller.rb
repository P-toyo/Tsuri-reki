class Admin::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id]) #データを1件取得
  end

  def index
    @posts = Post.all #全ての投稿データを取得
  end

  def update
    post = Post.find(params[:id]) #データを1件取得
    post.update(post_params) #データを保存
    redirect_to request.referer #元の画面へリダイレクト
  end

  def destroy
    post = Post.find(params[:id]) #データを1件取得
    post.destroy #データを削除
    redirect_to admin_root_path #管理者用初期画面へリダイレクト
  end


  private

  def post_params #受信するデータの選択
    params.require(:post).permit(:species_id, :user_id, :area_id, :fishing_method_id, :prefecture_id, :date, :time_zone_id, :catch_number, :catch_other, :comment, :title, :image, :status)
  end

end

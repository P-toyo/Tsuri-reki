class Public::HomesController < ApplicationController
  def top
    #お知らせ情報を最新から3件取得
    @information = Information.order(created_at: :desc).limit(3)
    #投稿を最新から3件取得
    @posts = Post.order(created_at: :desc).limit(3)
  end
end

class Admin::CommentsController < ApplicationController

  def destroy
    comment = Comment.find(params[:id]) #データを1件取得
    comment.destroy #データを削除
    redirect_to request.referer #元の画面へリダイレクト
  end

end

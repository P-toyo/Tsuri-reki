class Public::UsersController < ApplicationController

  def show
    @sidebar_posts = Post.order(created_at: :desc).limit(10)
    @user = User.find(params[:id])
    @record = Record.new
  end

end

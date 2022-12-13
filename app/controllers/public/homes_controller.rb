class Public::HomesController < ApplicationController
  def top
    @regions = Region.all
    @information = Information.order(created_at: :desc).limit(3)
    @posts = Post.order(created_at: :desc).limit(3)
  end
end

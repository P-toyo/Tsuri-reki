class Public::HomesController < ApplicationController
  def top
    @regions = Region.all
    @posts = Post.order(created_at: :desc).limit(3)
  end
end

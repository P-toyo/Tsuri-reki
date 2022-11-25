class Public::RegionsController < ApplicationController
  def index
    @sidebar_posts = Post.order(created_at: :desc).limit(10)
    @regions = Region.all
  end
end

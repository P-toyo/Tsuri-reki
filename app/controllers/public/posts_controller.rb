class Public::PostsController < ApplicationController

  def select_prefecture
    @prefectures = Prefecture.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.prefecture_id = post.area.prefecture.id
    post.save
    redirect_to post_path(post.id)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def index
    @posts = params[:prefecture_id].present? ? Prefecture.find(params[:prefecture_id]).posts : Post.all
    @posts = @posts.search(params[:search])
  end


    private

    def post_params
      params.require(:post).permit(:species_id, :user_id, :area_id, :fishing_method_id, :date, :time_zone, :catch_number, :catch_other, :comment, :title, :image)
    end

end
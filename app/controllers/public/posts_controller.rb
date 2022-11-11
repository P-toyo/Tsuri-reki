class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.save
    redirect_to post_path(post.id)
  end

  def show
    @post = Post.find(params[:id])
  end


    private

    def post_params
      params.require(:post).permit(:species_id, :user_id, :prefecture_id, :fishing_method_id, :date, :time_zone, :catch_number, :catch_other, :comment, :title)
    end

end
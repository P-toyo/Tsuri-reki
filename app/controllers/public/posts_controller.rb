class Public::PostsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def select_prefecture
    @prefectures = Prefecture.all
  end

  def new
    @post = Post.new
    @prefecture_id = params[:id]
  end

  def create
    #ストロングパラメータ
    @post = Post.new(post_params)
    #Cloud Natural Language APIにコメントを渡し、返り値(分析値)を保存
    @post.score = Language.get_data(post_params[:comment])
    #投稿にユーザーIDを紐付け
    @post.user_id = current_user.id
    #投稿を保存
    if @post.save
      #都道府県検索用タグの付与
      post_tag = PostTag.new
      #タグ用のテーブルに投稿の釣行場所を登録
      post_tag.prefecture_id = @post.prefecture_id
      #タグ用のテーブルに投稿IDを登録
      post_tag.post_id = @post.id
      #タグを保存
      post_tag.save
      if @post.image[0].present?
      #Cloud Vision APIに投稿画像を渡し、返り値よりタグを作成
        tags = Vision.get_image_data(@post.image[0])
        tags.each do |tag|
          @post.image_tags.create(name: tag)
        end
      end
      redirect_to post_path(@post.id)
    else
      @prefecture_id = @post.prefecture_id
      render action: :new
    end
  end

  def show
    @sidebar_posts = Post.order(created_at: :desc).limit(10)
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def index
    @posts = params[:prefecture_id].present? ? Prefecture.find(params[:prefecture_id]).posts.page(params[:page]).per(12) : Post.all.page(params[:page]).per(12)
    @posts = @posts.search(params[:search])
    @posts = @posts.order(created_at: :desc)
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to request.referer
  end

  private

  def post_params
    params.require(:post).permit(:species_id, :user_id, :area_id, :fishing_method_id, :prefecture_id, :date, :time_zone_id, :catch_number, :catch_other, :comment, :title, :image, :status)
  end

end
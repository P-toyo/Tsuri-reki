class Public::AreasController < ApplicationController

  def show
    #グーグルマップを表示するための変数
    @google_api = "https://maps.googleapis.com/maps/api/js?key=#{ ENV["GOOGLE_API"] }&callback=initMap"
    @sidebar_posts = Post.order(created_at: :desc).limit(10)
    @area = Area.find(params[:id])
    @area_rating = AreaRating.new
    species_ids = Post.where(area_id: @area.id).pluck(:species_id).uniq
    @species_name = Species.where(id: species_ids).pluck(:name)
    @catch_number =[]
    species_ids.each do |species_id|
      @catch_number << @area.posts.where(species_id: species_id).sum(:catch_number)
    end
  end

  def update
    area = Area.find(params[:id])
    area.update(area_params)
    redirect_to request.referer
  end


  private

  def user_params
    params.require(:area).permit(:image)
  end

end
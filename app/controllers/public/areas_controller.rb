class Public::AreasController < ApplicationController

  def show
    @area = Area.find(params[:id])
    @area_rating = AreaRating.new
  end

end